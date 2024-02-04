Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AFEC4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 06:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62A2E408D4;
	Sun,  4 Feb 2024 06:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62A2E408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWlJNtITh5qH; Sun,  4 Feb 2024 06:45:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1DFD40461;
	Sun,  4 Feb 2024 06:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1DFD40461
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F272D1BF285
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 06:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C967A40461
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 06:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C967A40461
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CHEXHSCG9kDG for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 06:45:09 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E92C400F1
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 06:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E92C400F1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CF46C000F
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 06:45:06 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 04 Feb 2024 06:45:06 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240204064511.C967A40461@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1707029106; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f+QKzte2hZuOnQXIVPJAVnKsxHcDS87ipxgnJ2bltvE=;
 b=aw6YU+2gXtmyg61PrtC/rhxz7lBw01LPBzE9NZY87tUtzTs5wol3kbjN52qoFH7yk0H5Vi
 R3MdExhqszmBLyiLSGGWzeiSwaZctQgg//NttEAbVXeYdOAui0FpFeQmAwL7/iSBx8N5Gb
 xGPikZE+xM2C8VX6YqX+BfmrMKkhxx32d4fjyrHaHmauSmKLQZcI3rEXW+d22F2jOfnGQV
 zMbNRjgRgNolVslCmC57VzCnwOgdlrsJU6QEbQQyOPt+aX0XWuAbBHV3eYiOjbRJfK5LPw
 XPtASZSnH2V0FrZI2baspRr3H8zq/lTbvGaFZTp8QGePJGsZ+q80f51eFzZpbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aw6YU+2g
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-02-03
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

Autobuild statistics for 2024-02-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  1  |  0  |  3  |
  2023.11.x  |  1  |  0  |  0  |  1  |
    master   | 56  | 49  |  1  | 106 |

Classification of failures by reason for master
-----------------------------------------------

                  stunnel-5.71 | 6 
                  axel-2.17.12 | 4 
                libressl-3.8.2 | 3 
           dmraid-1.0.0.rc16-3 | 2 
                   foot-1.16.2 | 2 
  gobject-introspection-1.76.1 | 2 
              host-rust-1.74.1 | 2 
              libopenssl-3.2.0 | 2 
                 openssh-9.6p1 | 2 
                    proj-9.3.0 | 2 
            quickjs-2023-12-09 | 2 
                    attr-2.5.2 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.0.12 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 dhcpcd-10.0.5 | 1 
                   exim-4.97.1 | 1 
       freeradius-server-3.2.3 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
         gobject-introspection | 1 
                  kexec-2.0.28 | 1 
      libabseil-cpp-20230802.1 | 1 
              libarchive-3.7.2 | 1 
                libglvnd-1.4.0 | 1 
                libselinux-3.5 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
                    ngrep-1.47 | 1 
               owl-linux-1.0.7 | 1 
rtl8189fs-5d523593f41c0b8d7... | 1 
                  rygel-0.40.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/54fa4ecbd75cffc953eca39e925904a76918a187 |     
    or1k     |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/1bec54a60cd882c12f647e927f2881d31f283fc6 |     
    or1k     |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/e3c75cf272d4e1c9147f0682478ad555b020d888 |     
    m68k     |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/c0c3e2b15e5c7c98640f30c36f05819d4bd8fd56 |     
  mips64el   |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/ab64fea7797d2253cf5eeaeb7b3c68404f3339f4 |     
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/c5b3928c5bf43c9b92235eff79286e14cbae5e32 |     
  powerpc    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b7dc99fff8775f82dda3b8dbc3ddcfc1f440cc7e |     
    or1k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/249512ef82d05f3ee4c3a84dc369a7e43cf4cb0e | ORPH
   mips64    |         dhcpcd-10.0.5          | NOK | http://autobuild.buildroot.net/results/f6f69c648d5ddfa3b86893308aa77658b4335559 |     
   mipsel    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/3bb7bb3c08ee6040f4ebd474772d2258fb6ed7d8 | ORPH
  powerpc    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/35517c36d1e57859d91d1b83eac02e33b97be6fd | ORPH
 aarch64_be  |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/1632b4446f85c69c0f4fea39880b9826f8e3454d |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/9be95c713de60039a28374323a193befac5439b8 |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/46c068efc6aba2579a922b4b7be34f8601c20dc2 |     
  aarch64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/7944277e8c7805fe6a47ccc4ac676963d92c0b48 |     
  mips64el   | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/98af37b6b0e5f0f636f3ccdc38c937b5b68800c9 |     
 powerpc64   | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/47f3ed9a449e2f7371d9d2565b50e987bacd2a06 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/03086e91623ecd9b047f4d3439bebf32e8f30a73 |     
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b7036f1b7b098521164c9bb0f2f4f325dd5b858b | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/364612e7d7c9e844a3b3433b6055c402df8649d9 | ORPH
powerpc64le  |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/e7fd50183d758113e768269807c46c5d93fdd996 |     
 powerpc64   |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/89ca4aa002368a7afc9a7c8bdd13b23fb3696293 |     
   armeb     |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/d509b0f7ff32fe86cecc1d7c17ce91b6959c4cd5 |     
   mips64    |    libabseil-cpp-20230802.1    | NOK | http://autobuild.buildroot.net/results/d270d687d41981586b9d4ca4d96cb97eae95cb1a |     
microblazeel |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/23cf6d163b7ba2dd0e56fad43641ef2815b97f8a |     
   armeb     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/8d3b780a4b820190109809d1445ba26dc601461b | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/8d7adbedd2c66cfac1ede0d160d5b6dbefcf9add | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/5ab84155b946b54fc371515343bac20b8755f30f | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/0eadd0da3a816163dbe01fdd5e7e61dafb84f9f1 | ORPH
  powerpc    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/cbafdb8b0ce79348df7097dc739679bb27bd46ab | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/674f58d1fb5d8bb2e902aab4e34f2f08fa6be59a | ORPH
   mipsel    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/63a214194d4c5a65bf24677980f1a2f0eb2d72c4 |     
   mips64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/cae538ef3a9edab4d91402a6503e586000d51957 | ORPH
    arc      |          linux-tools           | NOK | http://autobuild.buildroot.net/results/a183b583f962fddf0c4d8f4fba6fd1ce65fab61f | ORPH
   s390x     |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/fe77dc606b1c3e9932a83d2be9549d159671432e |     
   mips64    |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/f3f2ad35d46eecdef3695bf747a72fe20deaa3a8 | ORPH
 powerpc64   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/7e390e56efbba932767ca22204ff85ed4809f95c | ORPH
   armeb     |        owl-linux-1.0.7         | NOK | http://autobuild.buildroot.net/results/58a6289afd968ef066a0ab8e57773761820a7563 |     
 aarch64_be  |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/ff8af3147cf33f8aa0643b35b84e186dcdd3971a |     
  sparc64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/cf988f1f70bc105a7d8358d368ff2af14ccdc1f8 |     
    arm      |       quickjs-2023-12-09       | NOK | http://autobuild.buildroot.net/results/373ae864d98e2ce09f883a0a7c6037526865d4db |     
    mips     |       quickjs-2023-12-09       | NOK | http://autobuild.buildroot.net/results/e3931354ad77e501340d72c1890110293e67e536 |     
powerpc64le  | rtl8189fs-5d523593f41c0b8d7... | NOK | http://autobuild.buildroot.net/results/90efb55454f51dea56654fb6931eebdc381b23cc |     
   mipsel    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/df16e1bf0ca6ecd4ae8d08b0e30724e99e69221f |     
    mips     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/2f69a938c594dc616202549b399e56c1508473d2 |     
   nios2     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/84af3c35cab4101bcfd6a4b543699fb01c2be9a8 |     
 powerpc64   |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/2e3eb561ea70ae7edd48382a846f8305605eec32 |     
   mipsel    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/ff9fe9126509d062b48c12f2d34fbfe77d6a2bea |     
powerpc64le  |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/f2a438e16f27575ac9786e1e945994d66a3788b6 |     
microblazeel |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/7dec0b934fc6a647d6d6d344f1c75d1f350a5e38 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                       kmod-30 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/5eb496e3a342d6e13a777512fb0e710895283ef5 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
