Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1993CEB64D7
	for <buildroot@archiver.kernel.org>; Wed, 21 Jun 2023 04:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3976A82FA2;
	Wed, 21 Jun 2023 04:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3976A82FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vh2GTJBQCKA9; Wed, 21 Jun 2023 04:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E05D82F4F;
	Wed, 21 Jun 2023 04:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E05D82F4F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21AB01BF36F
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 04:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6F7A4052E
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 04:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6F7A4052E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDxRm9xZNjMp for <buildroot@lists.busybox.net>;
 Wed, 21 Jun 2023 04:48:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72D10400B8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72D10400B8
 for <buildroot@buildroot.org>; Wed, 21 Jun 2023 04:48:11 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 585D91BF205
 for <buildroot@buildroot.org>; Wed, 21 Jun 2023 04:48:08 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 21 Jun 2023 04:48:08 -0000
Message-Id: <20230621044812.D6F7A4052E@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1687322888; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SWxjLooFn138KvB1LTBKDX7z6O5YiyYo/OWzDH3hBx4=;
 b=PRikq1bHWvW+3l2IYYk3GcdbxNpgyRylvcfkkYUfRlr3MakVI5DjsobVganuEOx14YLH32
 ecONdWrESHfskP7qLxTg3UJFfiPk1B4yW7dmx96Ys53oNPD1t8hg+I9DGeQuc2nM7fypzi
 16Z43Xk7/JrFqhUqLw+VAwk33j51TEc1d6Lo0/JRObTOexn3DpUday2ZEZI8Qd7aI0o80k
 G3wG9lyNyXtJIgNNbmT5o/vEyJb1kIZRRPRzEYbZ+E2fRsiQEAWNM/h6rDbUh/DOlLiVrc
 SuJtMD2WusYlNSUy6XKyr2tiEkiuPhvwLj/cKrzFpw0HI/h9DRxzO2G930fOSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PRikq1bH
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-20
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

Autobuild statistics for 2023-06-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  2  |  0  |  7  |
    master   | 20  | 31  |  0  | 51  |

Classification of failures by reason for master
-----------------------------------------------

             host-ccache-4.8.2 | 8 
                   gupnp-1.4.3 | 3 
                       unknown | 3 
            host-binutils-2.37 | 2 
                 agentpp-4.6.0 | 1 
                  check-0.15.2 | 1 
                elfutils-0.186 | 1 
                  faad2-2.10.1 | 1 
                 fdk-aac-2.0.2 | 1 
                  ffmpeg-4.4.4 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
            host-binutils-2.39 | 1 
               host-go-1.19.10 | 1 
               libglib2-2.76.1 | 1 
                libglvnd-1.4.0 | 1 
          lttng-modules-2.13.7 | 1 
                 openssh-9.3p1 | 1 
                     pv-1.6.20 | 1 
                    strace-6.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/02c8e7bff02e96bb940148ca0f2cfd11127acbec |     
    or1k     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/9effad21d26d7786e606dd48a9145ce745451273 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/39a3ea6509dd8edbd1d26ccbd267d56abe556044 | ORPH
    sh4a     |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/e17940b74f6a98a5bbe073748149231ad6f4de64 |     
    i586     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/7586789cdea1a75d4c4c7c6f991cecefb9b03180 |     
   arceb     |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/71137c39b1e7ae8490ea383e16117bf4572e7bb0 |     
    sh4a     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/062cc0e3ca03e02f206dd6a9ba0496f17f6545b1 |     
    arm      |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/3896d338a0f85a7862028acb82776f5a629742bc |     
  aarch64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/27c3ab4cbd74d7f8c1379812a3714fc30250c357 |     
 microblaze  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/c2f778beddfd61a29189406030dc11e074f6eadc |     
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/29affe33098f6f2fbcd3611f407516bb99476719 |     
  mips64el   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/666aa3968c3260872dfe485a028d786d8f905037 |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/439bf9ec0f68c474e0f8a9cb9c21d6b6134b9789 |     
   x86_64    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/a7d22165da35a1da8d1d2f546d6c48d83ebfec06 | ORPH
  sparc64    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/593e5bd1231c05abb2bf9dbcacd37b1968e5754c | ORPH
powerpc64le  |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/1c6bb594d5dffdfba1785676f1085dc8acda10e6 | ORPH
 aarch64_be  |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/9cd340c48aeed52b75702a6f945082cb2977cfd3 | ORPH
 powerpc64   |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/c781d163eb7b226ecd77b0a9e3cd0a5a736bc8fa | ORPH
    or1k     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/d57da6ffe4105a05202010c9994d8b6b66821801 | ORPH
  mips64el   |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/4e28cd6fccf5dd39eb23d58caae628f6cd88bab4 | ORPH
    mips     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/ced81e1a2db9d0b39a2a52f3051c6a6e2cecb3d9 | ORPH
  mips64el   |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/35d6aa16b698c488e8f28f4cad40d9f3c4502b5e |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b490be5297424101e31041732bd131b49e74644c |     
   xtensa    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/f7552981dd420dcf9d8bece07b37fac112e3bfdf | ORPH
    arc      |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/d7d5b96e83a7d2f8d7c366b37b2fa4302aa9eec1 |     
    m68k     |         openssh-9.3p1          | NOK | http://autobuild.buildroot.net/results/e68fac961e04cd34537a3ddfc1f020cca09211f6 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/044ba0f4b441834911cf2f93655a4f45aa3d811d | ORPH
    arm      |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/b61df43605ef0b8bd03b4a18bb9f7cade9b010f7 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/79fb06b6481e551ee09aa971185ecceed82b46bb |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/1920ad165acf0ba9c3e687d23ebbbadaad2e31c8 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5eb969b1ca61618b49b9c28eeffbc4dba0eaf502 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

            host-binutils-2.37 | 1 
          lttng-modules-2.13.7 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/ff285ac2da95756ee2874b7c15cee060c2d0ae6b |     
    arm      |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/bff8c2f0faba6e3a7fbb31c175f4c3a962050b0e |     


Gitlab CI results for 2023-06-20
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4505977906  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
