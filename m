Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E94CC072A2
	for <buildroot@archiver.kernel.org>; Sun, 19 Nov 2023 06:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53151418FA;
	Sun, 19 Nov 2023 06:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53151418FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l_NI5cyZb5rp; Sun, 19 Nov 2023 06:39:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F7C2418E2;
	Sun, 19 Nov 2023 06:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F7C2418E2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A36E91BF335
 for <buildroot@lists.busybox.net>; Sun, 19 Nov 2023 06:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3269160B55
 for <buildroot@lists.busybox.net>; Sun, 19 Nov 2023 06:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3269160B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tUX0a-_Jh3H4 for <buildroot@lists.busybox.net>;
 Sun, 19 Nov 2023 06:39:05 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2715660B14
 for <buildroot@buildroot.org>; Sun, 19 Nov 2023 06:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2715660B14
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76CEE40009
 for <buildroot@buildroot.org>; Sun, 19 Nov 2023 06:39:01 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 19 Nov 2023 06:39:01 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231119063907.3269160B55@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1700375941; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M1QJEaow8Rey6Sd5zf/LkiMeCq2nX1XuPb9fuesKNLA=;
 b=mHbrofSqvh4AKbkBetCJX0WRJlxA4h00+CJucIVP9bRITxlgJbOFRFbFnbWkuBW4uB44tT
 MgH02nrDHz5EQjQBjEET5kEpc2MdMnXq3fb6EvVMWVxYurQoh/EB7YXRyYyS6JmJL650fu
 yY/HhL+KTI80U98QNte3Bq2gK1Lq93BhOKQNrqOHF+TiBn0K5eiF32tzah3I/euqhlyvKG
 X04cv9rC3VeA8MmRB3tWPaX/tkMsHPDZ3ihxVKDmjhC7+6qlJfnwTKWCgtKxHhuz1IXQz4
 oI52pfltoCyDovVbZ5wU3ezn3lHKkB7ROyvr7epmmKi5En/K2Dt5eKuPwJuZFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mHbrofSq
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-18
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

Autobuild statistics for 2023-11-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  5  |  0  |  8  |
  2023.08.x  |  5  |  5  |  0  | 10  |
    master   | 13  |  8  |  0  | 21  |

Classification of failures by reason for master
-----------------------------------------------

                host-go-1.21.4 | 1 
                libressl-3.8.2 | 1 
                   linux-6.6.1 | 1 
                    pppd-2.5.0 | 1 
                    putty-0.79 | 1 
         python-rpds-py-0.12.0 | 1 
                python3-3.11.6 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/c3913822eba997ec8d1146dceda1225573f9bef5 |     
  powerpc    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/38d648a4374d8326308133b8f5bc4575edca8c31 | ORPH
    arc      |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/1c56670851f6a3780b4924c78894c0545ee8c020 | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/8a07d0455a0551d58a9c569bc8b09f03f47faf4c |     
   armeb     |           putty-0.79           | NOK | http://autobuild.buildroot.net/results/36b7c93d12bf079cd7dd0627eccd21a7daf2e40e |     
   mipsel    |     python-rpds-py-0.12.0      | NOK | http://autobuild.buildroot.net/results/89272b52872e36efd5e4294e29d23a1d9e05cc30 |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/dabfa795524734e9b68300276aa535dc3e2d216b |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/27369ecd1c8ada4cda17d80c5c0bc355be6d913e |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  check-0.15.2 | 1 
                elfutils-0.186 | 1 
                  ffmpeg-4.4.4 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   perl-5.36.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/282ef3b54a79a51f2bd1d888223e69d0d8383562 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e5bee8f2c819f5cfb4c6ea3edf3e038f06f051d7 | ORPH
    arc      |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/b0c67cff24d2c26810329b88b6e998b7e6cb0596 |     
  sparc64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/8e6a158329481d67e42162beab85a14831242295 | ORPH
   nios2     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/abcc5967da0a2466ca1e971c9cab988865810a5a |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                 apache-2.4.58 | 1 
check-11970a7e112dfe243a2e6... | 1 
              host-rust-1.71.1 | 1 
            quickjs-2021-03-27 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         apache-2.4.58          | NOK | http://autobuild.buildroot.net/results/7b27234816c3705aebbf48a3fb656627c4af9de5 |     
   armeb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/8709ba67aee4f108a41939d6339f887f078a2cf5 | ORPH
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/08f86ff084d8142287a560bb6c4d35f092243bcc |     
    arm      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/705d13c102e89b47d06ae67faa7de647c980bbd7 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/d49ad342a2991f61a0d6c3b82eb2b45a02e6e236 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
