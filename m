Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563D6C25B78
	for <buildroot@archiver.kernel.org>; Tue, 28 May 2024 04:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C261819D5;
	Tue, 28 May 2024 04:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uhNe631xclGd; Tue, 28 May 2024 04:03:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BF7181EE8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BF7181EE8;
	Tue, 28 May 2024 04:03:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5CB91D1C4A
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 04:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1A4A4058F
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 04:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWPM1HZMjcz7 for <buildroot@lists.busybox.net>;
 Tue, 28 May 2024 04:03:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00CC24058B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00CC24058B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00CC24058B
 for <buildroot@buildroot.org>; Tue, 28 May 2024 04:03:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F5B81BF20B
 for <buildroot@buildroot.org>; Tue, 28 May 2024 04:03:11 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 28 May 2024 04:03:11 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1716868991; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wHXmEl92TsX8iMLdW6ty6oGzvF144lnsbXeuhYhjb2E=;
 b=Ad7WjpA53RenOQxKAxAomVcx5k+wNuKhidwI38FHGUOHXEZT+qWIYF45jQLEDH6NuTj7xR
 CmMWVCs7Q/f5M9nmcJidan9r563PsFyVtmTViu9f3uZkwvN/B5uNIk+9T73AFLYWI4kyV/
 Z11ZU33F5vF10JmvBlHwSUp+AhU/jTJ7iq1wrubL1W4T0Z1IkHlyfRA16/eK3JtXMnJ7bL
 4NWUSl1J6oYk822DcpLIvsTj6Gg7zxwIFY9KmEfBT5x19jGUEEc2H1/MbIk1NEhR5oG4n7
 9l+A1YSSYsJuJERPElRVPfXyZ42jZ/lKyQS1jSURRJcYsl6MOaGSsAWpJJcMRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ad7WjpA5
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-27
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
Message-ID: <20240528040311.OhLYJoX9VTd1thLrOWddGSwcp4ABoz_p6BUWo0KPBsA@z>

Hello,

Autobuild statistics for 2024-05-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  0  |  8  |  0  |  8  |
    master   | 22  | 42  |  0  | 64  |

Classification of failures by reason for master
-----------------------------------------------

host-heimdal-f4faaeaba371ff... | 4 
                       unknown | 3 
android-tools-4.2.2+git2013... | 2 
check-11970a7e112dfe243a2e6... | 2 
                 coreutils-9.3 | 2 
                fail2ban-1.0.2 | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
                libressl-3.8.4 | 2 
                 shadow-4.14.5 | 2 
aer-inject-9bd5e2c7886fca72... | 1 
                     apr-1.7.2 | 1 
aubio-152d6819b360c2e7b379e... | 1 
                   bird-2.0.12 | 1 
             containerd-1.7.14 | 1 
                  ffmpeg-6.1.1 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
                gnu-efi-3.0.18 | 1 
             gnuradio-3.10.7.0 | 1 
          libcamera-apps-1.2.1 | 1 
              libcamera-v0.2.0 | 1 
                 libp11-0.4.12 | 1 
               libunwind-1.8.1 | 1 
                   linux-6.8.9 | 1 
                   linux-tools | 1 
           mediastreamer-4.4.8 | 1 
                memtest86-6.20 | 1 
                    ncmpc-0.49 | 1 
                    proj-9.3.0 | 1 
             strongswan-5.9.13 | 1 
                 uclibc-1.0.48 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/87283e34384fe5a6e80d78f694a848c95b984d9a | ORPH
 aarch64_be  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d1d3450026a6a3468036c202737993b61bc5cb91 |     
   mipsel    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/fde1995768bd75ec2ff8288c7a44093ffae288b6 |     
   x86_64    |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/6ba322ceb5d4f896e3e6e800f2b05e2c188f27fd |     
   sh4eb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/e73b68530b69a64c2a7351f130b015616647576c |     
   s390x     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/8bfa611905456aae4cc608178903b01e01a91b25 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/80e8bbac238ecd5988d1700490249742e5e4fb99 | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/193fe0fb19bde83e813f506c8cf4ef361e7b357b | ORPH
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/40bff1f26df8036059c5df9861dc378722bb6301 |     
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/204d037a72b81e89e3e6d881d17223de4f0dee59 | ORPH
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/9b8505706155d740f71903056af89797a504f3e7 | ORPH
 microblaze  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/099213b0c8c3b304d1266a9280737eaf33b47a47 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ed29bf8d30376f72a5329b1ad1d0e82e30445cba |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/ae47615533debe4402ee27eab322c5718d6394af |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/351f649953b1063a4e8bf60ef8fcca8cd005f290 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/d4cd0fdeddfc8580cc99432fd4d095af7b542372 |     
   s390x     |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/4fc2dfa0691b8e7e5a429fadac011c1d472f29e8 |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a49a239bf8dbf15a0e10a138e0f10ae2d33fac14 | ORPH
    mips     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/98680519e807877cca4d3a10f290c660e96adf21 | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8885a0aaa773356bca357d67ec6668d99592efc8 | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a6488846e52bbe51353eaac24af8183a6f02fc3d | ORPH
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/762e28c416ad6b40e8c4aa58c5eae7e8c51c6d69 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9000b945e13078267dd42d80d5b3a427921a1446 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/c63cd21cadfeb137e8af22dfd4994b26b216e2b6 |     
    or1k     |        libcamera-v0.2.0        | NOK | http://autobuild.buildroot.net/results/ee4188fbc9c0b43843f994a213431d5642cd8884 |     
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/497f98e62cdb2efe56e9afdf19843ba529bdd578 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/25066c58cf8d8d6cd11b93ea4e9cef0b2db8aa44 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/eff3b86dd888d0406e1390c2df4fc33702438493 | ORPH
  aarch64    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/22fcf02bb5d5dfd591c78948a0ff098a74adcb01 | ORPH
 microblaze  |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/9d9ca04aa141990626b29ea6b6999fbeb8a8f156 | ORPH
   mips64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/e1586e6a32da19f3467118f73f10a860ebed249a | ORPH
    i686     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/bfabee5f15a3e0a5db3c33d2a5011dac424a1b71 | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/6e8d6ec398ddbb42e0182c00c16d24cd769e2eff |     
  aarch64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/7c3d2e07f05a3da30ddb68b51d82c6e628ba4619 |     
    m68k     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/479f3a83bbf3dbdbfc7825964f57d49a232e584b |     
    arm      |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/8d8ea79eed1e5cbe3f2d4d2adbc3189cf0708e68 |     
   x86_64    |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/d48315fea6f34f2c1dc25ab6b260cdf0b609643d |     
  aarch64    |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/bfab71247912ea9e90a68c0f0cb2177fc878f3a6 |     
    arc      |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/ee59e7bb46dae81ffa732d49cd2067e539f4ff88 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/310081d0cc61259fab2df41e567d8341f205605d |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d10fe5e2d877b7bfcf69873beea1037ea445dbcb |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/715e27903a68a3637996dd4faa8ab78f97cc9409 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 coreutils-9.3 | 1 
                elfutils-0.189 | 1 
                   foot-1.16.2 | 1 
  gobject-introspection-1.76.1 | 1 
        host-sentry-cli-2.20.3 | 1 
               mariadb-10.11.6 | 1 
        network-manager-1.44.2 | 1 
               valgrind-3.22.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/378a0a71fdee2592462e8f630d85480414fb3911 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/65cb601bb1507c7526dc313a5a5da6423b0c0809 | ORPH
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/07fad9da1d56ec610bac9280af1777f703e8ddb2 |     
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5008c5710f8f3058218d6a244dace1f69f777cb6 | ORPH
  mips64el   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/438b7544c507d93fbfdf5930141133084aecc65c |     
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/1a68f239d3f6de684545c303dcb771af22bc6a64 | ORPH
   s390x     |     network-manager-1.44.2     | NOK | http://autobuild.buildroot.net/results/800e733f772beb8388bfc2e21e74b2a48b2a3095 | ORPH
    i686     |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/6f627946595d256142017161d6807e4195283017 | ORPH


Gitlab CI results for 2024-05-27
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/6944730068  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/6944731392  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/6944731401  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/6944730549  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/6944730641  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
