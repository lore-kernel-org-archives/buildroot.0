Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141E7C7EE43
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 04:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64B2B40A08;
	Fri,  9 Jun 2023 04:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64B2B40A08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FjRrSrUKCwNB; Fri,  9 Jun 2023 04:39:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4948F40570;
	Fri,  9 Jun 2023 04:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4948F40570
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1BF21BF38B
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 04:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B56240570
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 04:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B56240570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ODEC_1pYo9wW for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 04:39:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B037840189
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B037840189
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 04:39:42 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4B8D1BF20C
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 04:39:39 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 09 Jun 2023 04:39:39 -0000
Message-Id: <20230609043944.8B56240570@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1686285579; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e1gzfRrm0j2O23beuD7MSU0CTBoRW86W5G2UYUTTUiA=;
 b=lonUDu9QbOKtkJjOdJxQDzRdg+YswtlmlCwcGNB4yTlHrHQwtHRNcrf5gxpGxZvsuFhzHV
 icEsmcD6vAKZg2LVBzKSxMebqfJYd90D/QsTOuTeghlxC/px4u2rYX1UaK6Ctaq3UtGBtI
 4c7XwcCbDroSTPib0C+mMWJ4JNn7sbNyk4ezH9xk3j9G1DuwqE71hztO2Bg+Gj814kVbPS
 2OoYfBX8iBIyGxL9wqpTMkW/kRuqoeiQecrgJgLzVqZtEX2B/SEwZYtyxKUCNy6HRiNG9m
 LUANRtqyJT6n0QNMMjRk8TWa+b4AVymmTf5WMOl554EJgOe4Q1A7kx5LsGrQtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lonUDu9Q
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-08
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

Autobuild statistics for 2023-06-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  4  |  0  |  5  |
    master   | 69  | 47  |  0  | 116 |

Classification of failures by reason for master
-----------------------------------------------

                 agentpp-4.6.0 | 3 
  gobject-introspection-1.74.0 | 3 
            quickjs-2021-03-27 | 3 
                 highway-1.0.3 | 2 
host-heimdal-f4faaeaba371ff... | 2 
              host-rust-1.68.2 | 2 
                  kexec-2.0.26 | 2 
                   linux-6.3.6 | 2 
        ltp-testsuite-20230127 | 2 
                xenomai-3.0.10 | 2 
             dahdi-linux-3.2.0 | 1 
              dropbear-2022.83 | 1 
                elfutils-0.186 | 1 
                  ffmpeg-4.4.4 | 1 
                     file-5.43 | 1 
fs/ubi/ubi.mk:51: /home/bui... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                haveged-1.9.18 | 1 
host-gdb-arc-2020.09-releas... | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                  libsepol-3.5 | 1 
               libsigsegv-2.14 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  nginx-1.24.0 | 1 
                    olsr-0.9.8 | 1 
                 opensc-0.22.0 | 1 
                   perl-5.36.1 | 1 
                  reaver-1.6.6 | 1 
                   sdl2-2.26.5 | 1 
               syslog-ng-4.1.1 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/d08ae911f875af77c6bb4f503301b35eb34353ac |     
    m68k     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/8e41403b086fd4380fbcd350fc4f89a0672b0f13 |     
 aarch64_be  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/36b9988c6e9334bd5810877b9178c813ad597e2b |     
   xtensa    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/1de887a1db20d3dc2f8c8f568e50d4c85655183a |     
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/e38b35ffbd644e94582f9e574dd08ace67a7a485 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/70e12067a1a081489f417a21519bce5aeb393320 | ORPH
   arceb     |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/ed96872d07c7d341bb27571feb8722cb35344f79 |     
   x86_64    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/8b282f2ba72950cd363d823ac9235b78dba6965f | ORPH
 aarch64_be  | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/597cf8be36cc8a013faf3a75bcc79627f47d9908 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/50009053a83b6139b03a9cd36541da3951312c50 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5b9504dd7473871efccfdffc10ea7dc5ca62cb80 |     
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/d6368f839d3031074e5c61096f86a98f9f3392e0 | ORPH
 powerpc64   |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/0d1b181640a10b9bd3a3a09b60c16b59ce4e2ad3 | ORPH
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/74cee07f58429ea83af3468eb046ae31c1ba3e36 | ORPH
   armeb     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/45e2b136a58bfb6eb78f7b0da9466464c114465d |     
 aarch64_be  |         highway-1.0.3          | NOK | http://autobuild.buildroot.net/results/7c265cefe9b17924648f6bae6b75adbf72a69503 |     
  riscv64    |         highway-1.0.3          | NOK | http://autobuild.buildroot.net/results/6ba12eeedda480f1287d94b5d3d7ace923cb9b68 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/bf917855ec091e2e1fee45d3dd6c1e7b849af40d | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/48b52d205150e30e522b40d1c7b51f339ae8b0db | ORPH
  powerpc    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/764c94e1f9758dbadd595e052a8b40b0bb776e87 | ORPH
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/790e4684825348037fcf4be97d5a7ad7780c3f75 |     
   armeb     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/02f1dae2c068ef4db1c056dbfba8e363369853be |     
    arm      |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/edb0953f74dbc414e0ea814c6cbbeec8ab95995b |     
   armeb     |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/9bda26c3ad5291c4cf7716059bd17da9172d9310 |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/1f31f2d4917ea723cc2e1da573f5959520ee9e1e | ORPH
    arm      |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/79c58476cc80f216052c309746cd6afbeb59447a |     
   arceb     |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/ffb8393affafe03af8d2266feb7887ce65c5514b |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/311312ec6d0f184c98bb10800583200ea3d91414 | ORPH
    or1k     |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/4024f8dc2b86c743ec31061adddb9a091c1f5fd5 | ORPH
  mips64el   |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/59db86959cd38a518e7314bc076163af5d960902 | ORPH
powerpc64le  |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/ba69e45336dd6042511a159155de0db07d21d2b2 |     
   mips64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/f4791114a8eff203bbc27398b4cd306908b595c4 |     
    arc      |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/621f7f9c07ae9ee6938f4b3b15421c3487afed56 |     
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/9b7fc7b13dc5b18d3497dced35bc81ee0d108fe9 | ORPH
   armeb     |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/98276ac6288b0b2652819c693775fd7757233538 |     
   arceb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/56a0f71af2cc4b8d099c9fe9de950dfcf76056c1 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/08656052483977b90baab86775ef20386669a1bd |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/177494146317a5db576817f9f693c175ca208e38 |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/6b31d82649778799a7a4d34409d6e6832bf68a8a |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/27aa55e5d1d480dbfbb3115289fb8a47ae9a853f |     
   armeb     |          sdl2-2.26.5           | NOK | http://autobuild.buildroot.net/results/3629b08fe77f6cfc67213da92120aba46b23bfea |     
 powerpc64   |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/412e67f4c8ac90e98afd1a3be4e513f9f306788f |     
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/8b9a7f7a1a5c65dbd4108d9f2ea1df566850a8df |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/c4ad8758d6f2096d5568452af93f40ab36633bd7 |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/ebee9d8558b1080b1da9006a47fb62352a047cd9 |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/6b5939695e2b6211f4233db611a12eb959520392 |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/e6a0b19f34febf023d3612046d5f0b0bff6f5e6b |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

fs/ubi/ubi.mk:51: /home/bui... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
host-gdb-arc-2020.09-releas... | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/9f605710413ccffbbb3518377353137c3db839ee |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/17ca4c42abd64f85debf2aa63f41e30377785381 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/e76926c5bc00fa4f72cf7e89eab1db8e6c21485c | ORPH
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/fae47fac2a2924c28b7264a0e3f483854a018ca5 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
