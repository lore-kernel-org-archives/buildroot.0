Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D014C77B75
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 05:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A569B40164;
	Wed,  3 May 2023 05:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A569B40164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xc_KDx82eMoc; Wed,  3 May 2023 05:39:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D17C402A8;
	Wed,  3 May 2023 05:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D17C402A8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9877F1BF3F2
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 05:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 723B541B75
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 05:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 723B541B75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NvaKXnleGpOE for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 05:39:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84B8440940
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84B8440940
 for <buildroot@buildroot.org>; Wed,  3 May 2023 05:39:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BF900240009
 for <buildroot@buildroot.org>; Wed,  3 May 2023 05:39:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 03 May 2023 05:39:17 -0000
Message-Id: <20230503053922.723B541B75@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1683092357; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+v7KRvybI+2fm56Y/SCCLmmKzolWHjMVvCJrsvSWsfE=;
 b=TTSmmACRTtAlYdqtY3GTC9m7m3zdeEqM6WVXHDdmYEOPGqG14E66DfBq66DTNIqIHxRVAi
 XSDyPTaW4Uv+gjJdj4QSgdGj9eN+lPj6Nn5u0/Tta77IZ7hu3GT3qRj7R4pJHu5ZxQpHem
 5LIDuc6fHye/CSMaxMuLsPLL8QCrfakfROnCDFELom0Rv9zXGRwlFpfHZGW/Cu2ryDFJaO
 dCRaI5tOoqOhuNNi/3FsMDIJVGcUUexMT6VRfi5wWzh7H0K8uWq5r2p+K06dp6IRGRy/r5
 FF8svD+dLg0+yKaWBxggK1RPJJpBdw5OUq5qyNnAAVhyVWdDwmKe4p4kADjQHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TTSmmACR
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-02
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

Autobuild statistics for 2023-05-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  7  |  6  |  0  | 13  |
    master   | 17  | 20  |  0  | 37  |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-7.2.0 | 4 
                elfutils-0.186 | 3 
               arptables-0.0.5 | 1 
                  assimp-5.2.5 | 1 
                     gmp-6.2.1 | 1 
            host-binutils-2.38 | 1 
         host-gcc-final-11.3.0 | 1 
                host-go-1.19.8 | 1 
               host-runc-1.1.5 | 1 
              host-rust-1.68.2 | 1 
      libabseil-cpp-20220623.1 | 1 
               libglib2-2.76.1 | 1 
          linux-5.10.162-cip24 | 1 
sconeserver-8d1935919a20133... | 1 
             stress-ng-0.15.04 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/fd5605166570ed07c3f7124e8f33cf20c074553e | ORPH
  mips64el   |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/eca786ffe6e8eda38c8e473c1c42de926595f44e | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/48e716f5856e5170b27bb7b1caa78fb0b4147a7a | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7a0e8e6a57340ff3ba962610fd4ae491c1e12360 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/aca8bf1329c1f688e38d55e971dd3b8e224dca7f | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/02f1c38f9bd5c523dbabaaaff09b1e8e90d4a8f3 | ORPH
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b95cbd26c66d7fb6020412809f5bf2f976f1c53d |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d2183a7864b1d0d60b4a1c33625cde5d09258407 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/fbc60471bc4b136acf2f3ef2651da66aecd45da4 |     
    or1k     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/02acd727006d42c782aafd6005d1a004ad655644 |     
  aarch64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/231468394c0d5851da1f14d0ddcc1433bf8d8756 |     
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/646fb1b85fde4ce1dc391137c1e4c3967ff4bcb5 |     
   x86_64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/46def1ab61c8c8d470ae749956627635a1ac2dee |     
    arc      |        host-runc-1.1.5         | NOK | http://autobuild.buildroot.net/results/62be54c55f862b9017122314b4bde7ffd8901142 |     
   s390x     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/baece678ae23258dffe8ce173d28c3dfe5a7753a |     
powerpc64le  |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/fc164e4cbc59a02cc735a5c33c195707d977e4c8 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/5ea1fa599f2b6057f428d633893c87717240f3fb |     
  sparc64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/c99f3a8813fecaedf142651c406ef4fc96a15eaf | ORPH
  mips64el   | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/ff5b7a4acc9bba4f289d8692d2c9809951112522 |     
 microblaze  |       stress-ng-0.15.04        | NOK | http://autobuild.buildroot.net/results/127ed4c110d99c6453a01ce221f628d40e566dc1 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-qemu-7.2.0 | 2 
                    dust-0.8.1 | 1 
              erlang-22.3.4.22 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/d0dd3a60b3c26ede0a7d21d988b7bacb48f3faa9 | ORPH
   mipsel    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/be2fff9f68db97fe6ceeecfc3ea65d48a16a2fc1 |     
 powerpc64   |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/f148c53ba62646bfd46262cd34b9afe108a5f5bc |     
powerpc64le  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/822243a028563a0ca07e000845dec2e4ebbc76d8 |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/93771270c55adb5f297442041dec33c07189c110 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f8157069cfa5ade60030457453e9503ae996ec3e |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
