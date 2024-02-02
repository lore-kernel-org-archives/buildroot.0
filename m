Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D08C47258
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 06:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42BDF852A8;
	Fri,  2 Feb 2024 06:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42BDF852A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2_7GQfxQbUx3; Fri,  2 Feb 2024 06:53:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43D61852B5;
	Fri,  2 Feb 2024 06:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43D61852B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 893BE1BF842
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 06:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6074440AA5
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 06:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6074440AA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B83xX7K4eU2j for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 06:53:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00059400BF
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 06:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00059400BF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19F2E4000D
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 06:53:45 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 02 Feb 2024 06:53:45 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240202065351.6074440AA5@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1706856826; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0G2Fjcz9vTQveh4G1HpdK66dBkE2Ve66tDjZJHaSJQg=;
 b=RX3zeCEMysgTdyrsxtLvbHF31vuaxHbcriqFo+sOYDL3nQDMifhVLilyGZLAfNv5DiN6+Q
 rQlM4CvFgUoXaqTQDcPvgSikemdjuZFlGBIDmDEfcH6poINlbkX6G9mtbeiES+FqusOKV1
 bPwyfkA23JLADRDfPoupqsIAW2ha/6RdZDoAbWausWv08aRJBVb0CWcC92PELlUvmM+Kjp
 GHYlSEPJdeyCepPalE2xlsxC4dzt006/ZLtDMueR/g8UWkV7xeFerxOFejiiEsOtlfZvVy
 lbDbqXYjxaACQM1tiDbDfeMXoA0o5p7NnaSQqdWZVNE9riSMT8aHN4KNT90RSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RX3zeCEM
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-02-01
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

Autobuild statistics for 2024-02-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  0  |  3  |  0  |  3  |
  2023.11.x  |  1  |  3  |  0  |  4  |
    master   | 33  | 50  |  0  | 83  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 6 
                  axel-2.17.12 | 4 
                  stunnel-5.71 | 4 
                    attr-2.5.2 | 3 
              host-rust-1.74.1 | 3 
     linux-5.10.162-cip24-rt10 | 2 
                  linux-6.6.14 | 2 
                 openssh-9.6p1 | 2 
package/libpsl/libpsl.mk:33... | 2 
                elfutils-0.189 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
glibc-2.38-27-g750a45a78390... | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
                 glibmm-2.76.0 | 1 
  gobject-introspection-1.76.1 | 1 
        host-sentry-cli-2.20.3 | 1 
               ipmitool-1_8_19 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
          libcamera-apps-1.2.1 | 1 
              libtracefs-1.8.0 | 1 
          linux-5.10.162-cip24 | 1 
         lttng-modules-2.13.10 | 1 
 Makefile:727: target-finalize | 1 
                memtest86-6.20 | 1 
                    ngrep-1.47 | 1 
                  rygel-0.40.2 | 1 
                 samba4-4.19.3 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 
                    wampcc-1.6 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/9af7e787e8077936b1a05259f729582a9614b2af |     
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/790d67ae8ea9e8fbc8ed8cdd328b9532bb100607 |     
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/0a77d44e6eb2f91c9d4388ddb45a04922dd51b16 |     
   x86_64    |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/662fa6c7782f5f7a9f22de33bd5bec8c3291aa08 |     
   arceb     |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/a0aea4bbdebd5de6f76ffe6e51c6e10248fd97ba |     
    arm      |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/0a1298ef932038a7424546d7008797bf59c7d42c |     
    or1k     |          axel-2.17.12          | NOK | http://autobuild.buildroot.net/results/4f7e1014a63e969ed01ed48cfeb82cdb0e8830d9 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6cfbaff48595f92e9dce9f886ea0f2401e49036f | ORPH
    arm      | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/f03996539ddf219d274039f3dc29bcbf8c008ada |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/d2646173c7705f617cf3825cd728d8ae5b43c5f3 |     
   arceb     | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/69af5f9dac22874aeb3970e8875b9e913e3b3bdd |     
    i686     |         glibmm-2.76.0          | NOK | http://autobuild.buildroot.net/results/1486a0bde352dc7e555810d9e4741f0e95a5e333 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d15742461101ecc0c57b61126a3d9d8b73a2a34a | ORPH
   mipsel    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/80949b0782347964226daff0cb6070a6ff08f33d |     
  sparc64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/d1d3149b131d147d9483884227086649e2b01f2d |     
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/f2755733475bc6e07e257ad40519591a41947db6 |     
   xtensa    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/b98b846918ce8ed92e1afd7c1ca2ce98eb00a8d4 |     
   nios2     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/41b3ea01cd6639200508f5684b02af78e5562acf |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/94282249b3be51322adae66911982f833b25c192 | ORPH
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e6eecef2753bcf5b925acc2f5bbd313c169d5eb0 |     
    or1k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ca5e1df65fb5c571c6448efb897b182fc7266734 | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ed379db9c4aa6b18cb66be632b8d0ba52e5f7197 | ORPH
powerpc64le  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/918e1000aac7c22bb1dd4a5f7c189f4358eede11 | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/31f3479f2cac64440635eea3d9c55f90f701ff34 | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/5c2eb577770ce0fdcfef670d99902c29992c36d7 | ORPH
    sh4a     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/15ecb7a4b257f2bb74eaebc060eeef1aa463bf22 | ORPH
  mips64el   |        libtracefs-1.8.0        | NOK | http://autobuild.buildroot.net/results/21ee0fa42aaef4220cbcc0b7fc2c72029cdefab1 |     
 aarch64_be  |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/4a2cf86b3a3b8d85125db1c436a6c65927f93073 | ORPH
    or1k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/5bc0c9daaa34c037a0746805ab7ecb8d9a8ed681 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/b818ff6cbb6e69b6bd8f5187778cf641821858bc | ORPH
   mipsel    |          linux-6.6.14          | NOK | http://autobuild.buildroot.net/results/62b336d0f8cb23e276685e6322cbc42a715e9542 | ORPH
  powerpc    |          linux-6.6.14          | NOK | http://autobuild.buildroot.net/results/d4d7397ef1d858ea3fcf42945b42881938cff63b | ORPH
  mips64el   |     lttng-modules-2.13.10      | NOK | http://autobuild.buildroot.net/results/2988c4250697e33032e134abfe7dc6d29729d40e |     
 aarch64_be  | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/d4d926952d5c6f1516762406b1cfa3bd00035966 |     
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/d1c29928fffd88aab08b462b045a07c0ee80651e |     
   armeb     |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/4e93773aa6d3a9659e0278769cbfe6e5dfe27513 |     
 powerpc64   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/48c925b17ce4b722c0706abb94cc69b2cced8292 | ORPH
 powerpc64   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/77cf67c68b2e9205a2d6d0143650a6c28e6eb40b | ORPH
   sh4eb     | package/libpsl/libpsl.mk:33... | NOK | http://autobuild.buildroot.net/results/92e260c94cd4014fb8aa0301c0f6d65797c62a36 |     
    or1k     | package/libpsl/libpsl.mk:33... | NOK | http://autobuild.buildroot.net/results/9ddf8f6c324687c3df14368f97cb8a7fab765e16 |     
   s390x     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/42f5056c0fc18e73e8c92f257e4a05b894e8f297 |     
    m68k     |         samba4-4.19.3          | NOK | http://autobuild.buildroot.net/results/1425154816d1b63aa106c98e3e365a0da502576a |     
 aarch64_be  |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/3c6f8fb2c78967a19bc1ad856fe5f8ff3535773c |     
 powerpc64   |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/65d6dd016dbe9069cae16bca535c54d8112cee46 |     
    mips     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/54a3df17f5131e0bd1111db0d18052fe5c5fd91b |     
   x86_64    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/b5a1b55bc2b0b8457cdb84412ac357c6799139fe |     
 powerpc64   |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/363b4a241f25f21a2c4fa35f38e138ad41bf7562 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a78f55a73117b484e9287f7b846a891b804688c4 |     
    or1k     |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/d1ed86ff9d984c0c17936f322552120764244f77 | ORPH
  aarch64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/b5c744a9fc9ace759333bb5a02b1aff66c6f3f92 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

glibc-2.36-118-g22955ad8518... | 1 
          imagemagick-7.1.1-21 | 1 
               mariadb-10.11.6 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | glibc-2.36-118-g22955ad8518... | NOK | http://autobuild.buildroot.net/results/283ca78053d7add977661777f4a4748473b3e167 |     
    sh4      |      imagemagick-7.1.1-21      | NOK | http://autobuild.buildroot.net/results/c52223d0e0265bcf821d6d63bed606c48250ce61 | ORPH
microblazeel |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/609251bc1ef18dd4300ca7a99d614f7369741d84 | ORPH


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                  linux-6.6.11 | 2 
glibc-2.38-27-g750a45a78390... | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/b9d5226616ab30b0f4f62bbf016416e452d09d85 |     
   s390x     |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/4080bc9c1267e5413ca52bf5e5d378d5ac578608 | ORPH
  riscv32    |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/b343cfb567f91cdf57c368b5a3423840bdeb5497 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
