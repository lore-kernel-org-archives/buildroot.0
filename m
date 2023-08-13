Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23A7C001DB
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 06:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 521B960E38;
	Sun, 13 Aug 2023 06:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 521B960E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nm-4Mkmp5l7X; Sun, 13 Aug 2023 06:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E08160E6F;
	Sun, 13 Aug 2023 06:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E08160E6F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 584B91BF487
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 06:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18D2C40600
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 06:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18D2C40600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 300oPPMgSGsb for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 06:09:56 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFB264054E
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 06:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFB264054E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45E0EE0006
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 06:09:53 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 13 Aug 2023 06:09:53 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230813060958.18D2C40600@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1691906993; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=b88yOf7czZQE8q0R5WjsNzkwwOYgYCYT1luN8TfUopg=;
 b=nqXC6o5QdeDExQcBM1VnyN9wC++yHIeoRaQhw/fzSeGdj/G2uKZqt70xxXuYZm6obe4tft
 wS3tmgWxVN7nZYfsIjifyph0stkkXIigP5t5i1yF0AkkHee0CFuIWVsF832QFsG7+fcfnD
 xbYx5pOAUYCz5ZNF3usAytKgeWwHuKmB7kd4BeGC/navtiFltJIwzqDWCQjHX7a4Htr1NW
 33LjymJ8/5eaT7rVpxnUCMsrEmv7oSp3VTb0yENADKgvvim3kXf4j37gG/g6wtyYvyOKmw
 JcCnH6ZjKf4Ayu3GRASYc4yRWO4TaFjhg2OgheraxeDJGxPlug+BMJB9ZrtrSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nqXC6o5Q
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-12
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

Autobuild statistics for 2023-08-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  1  |  0  |  3  |
  2023.05.x  |  2  |  1  |  0  |  3  |
    master   | 60  | 41  |  0  | 101 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.37-2-g9f8513dc64119... | 4 
                host-go-1.20.7 | 3 
        linux-headers-4.19.290 | 3 
             util-linux-2.39.1 | 3 
             batman-adv-2022.3 | 2 
                elfutils-0.189 | 2 
               lightning-2.2.2 | 2 
                  conmon-2.1.7 | 1 
           dmraid-1.0.0.rc16-3 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
                     gmp-6.2.1 | 1 
                gnu-efi-3.0.15 | 1 
        host-util-linux-2.39.1 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
          libedit-20221030-3.1 | 1 
          lttng-modules-2.13.7 | 1 
                     lxc-5.0.2 | 1 
              open62541-v1.3.6 | 1 
                python3-3.11.4 | 1 
            qpid-proton-0.35.0 | 1 
            quickjs-2021-03-27 | 1 
                ramspeed-2.6.0 | 1 
                     rauc-1.10 | 1 
                   systemd-254 | 1 
               tcf-agent-1.7.0 | 1 
ti-sgx-km-cf7f48cb30abfd5df... | 1 
                   trinity-1.9 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/b5a6995a2d54ab409ce2145bad9f10ae10238a2e |     
microblazeel |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/c8314bf90ba1580d4133d00e7e9a570248a695fe |     
microblazeel |          conmon-2.1.7          | NOK | http://autobuild.buildroot.net/results/db301e9f556592828800fa663f2549f430adb58f |     
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/5b4321fb76760327d8b1043d45ef6860a18842a4 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/55e1d7afb716a340c70f5e038929d10047471359 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a5c518c2b5aba39c3ecb19c21d9de80fbe687726 | ORPH
    arc      | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/346853f30c4775862fd2728c0ab42e7178374240 |     
 aarch64_be  | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/e39655e72b20721ce305c6575ccab4268378ba3f |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/3caa0758b00adc9ba6d8fa0a35d1c67d7ab8aa04 |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/b6674e5d9de7a7509f273d727b5e005a529b2daa |     
    arc      | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/814277384f3c3a7e274b787a8295598e69b012f3 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/5da389461555338df0da30686e272534149cf85d |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/7a1d80dddb134ee9bf8ea30afdac414c861de922 | ORPH
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/79ff73673fa88c23107a9a7c51c1255333c1680d |     
  sparc64    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/76bc88952b81f0cfb71634282cfa8ce7f1ea521c |     
  mips64el   |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/a9b6e31db8145955aba6caaff0e31819c2a76162 |     
 microblaze  |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/6bf81238f3fd3d1c12d1e349cd9a3af798e79868 |     
    sh4a     |     host-util-linux-2.39.1     | NOK | http://autobuild.buildroot.net/results/4153fa7ccebc5666e0f2adb863d2e8751ca3b05a | ORPH
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/8e2b8af9e154b243dd4212e96398483a4e92e616 | ORPH
    m68k     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/439538b23776a58ff81c38754a19ee92c3590a1f |     
   mips64    |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/6f23cc85266ed165cead445c2798b2f55589f51a |     
  mips64el   |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/f62cb02dcfece9a47cc7b4e36916f11a836f1e3f |     
  riscv64    |     linux-headers-4.19.290     | NOK | http://autobuild.buildroot.net/results/b2f4b77897f869a3bda718902c92447be6e626df | ORPH
    arm      |     linux-headers-4.19.290     | NOK | http://autobuild.buildroot.net/results/065c889be29ad9a7576ad3c20b1c5ccf8f298849 | ORPH
    arm      |     linux-headers-4.19.290     | NOK | http://autobuild.buildroot.net/results/b090251af6979afda98989a5e5c5880722e4db28 | ORPH
  sparc64    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/44174670b815d676eda4ee1a965867d209b14b78 |     
microblazeel |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/6b097ecf34f9331f59a3ffe2d0b945c8de17b1b2 |     
    mips     |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/c11586ee3c2f83c6ed723f8758faeccf754f945b | ORPH
   x86_64    |         python3-3.11.4         | NOK | http://autobuild.buildroot.net/results/797291d1032a52a90e1c450ed167a5ca44197345 |     
 powerpc64   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/a7ff7971a5796a8552afebab8193c988737e9e78 |     
powerpc64le  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/f3b82e38ca81aeaa1d5e1a9ce00a96e9fdbee01b |     
    sh4a     |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/ab289769c5fea435934ed260d38e0a4fdd2ba72d | ORPH
   sparc     |           rauc-1.10            | NOK | http://autobuild.buildroot.net/results/87c5f33df2caead7c3dc5b56c571d6128f214e79 |     
 powerpc64   |          systemd-254           | NOK | http://autobuild.buildroot.net/results/aa65afd293368e0d11a86eb4e6fb0478124aa861 |     
   armeb     |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/3b5c5519a3e5ee490308bc1a1b9579ce13417235 |     
    arm      | ti-sgx-km-cf7f48cb30abfd5df... | NOK | http://autobuild.buildroot.net/results/2f110b3136f1be3c5e4a8063fbd2c4cdc4c19a53 |     
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/e0a76bd4bc9157489d52bd0935c6db9cad6ac010 | ORPH
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/76304cc1629d67742415ae6ba7089bbef4eab011 |     
    i686     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/15e221ace03fd50d3bc56ed87fdf8a0def18938c | ORPH
 microblaze  |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/55de26b5282cac6afee4a939bcffa58954363fcd | ORPH
   sh4aeb    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/272216af406827251e046f3c70970d54c2fa7d99 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  ntpsec-1.2.2 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          ntpsec-1.2.2          | NOK | http://autobuild.buildroot.net/results/77f4e4065874d022a2ae98d82508242f551e224c | ORPH


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                elfutils-0.186 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/98ad904db3dc712afa850739120445625b76901e | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
