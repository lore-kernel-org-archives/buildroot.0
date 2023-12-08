Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECE2C10DC1
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 06:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D345C824DF;
	Fri,  8 Dec 2023 06:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D345C824DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id goCu2MdTnqHA; Fri,  8 Dec 2023 06:42:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 192B582560;
	Fri,  8 Dec 2023 06:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 192B582560
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC5631BF841
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 06:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B21F6F510
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 06:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B21F6F510
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aUHDA2xHaOcU for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 06:42:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CD9C6F50C
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 06:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CD9C6F50C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 001E724000C
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 06:42:51 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 08 Dec 2023 06:42:51 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231208064256.6B21F6F510@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1702017772; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=33REsi/GsjtfZzdPKe+yGXFvMgdMucY3DSk/B5KvAY0=;
 b=a5LmF2ixIQLXnzihZ/8ZvxSn4WGWmd7VVsYexVjK//fcFHIu3aVHLjfeiUQCAUWRzsgQhL
 atl85vhmJVpiJ3QClSqkFj7aTqOY9+1VK10bOOSKwKcNT0wWQPb4Pn3Zbm9erVeI92mGYC
 9vopFJf+C6MsK5vWVGmFQBymQcbnKCC8K99u6soKwb/ZOCifnaOJ4fVFlSRQc8RlZYTb2B
 wzu1qRS/C5U+RxxTHDzp0V850lMVaZyau/hxgnpLDiztlC4LwMLDXm+QSgJh3IPzl7M96/
 YmaESM3nucWMZrPbMLh0idUN2rFiaisZHhSRTeLF04uU7ucPCrv7ZjhCMojpjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a5LmF2ix
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-07
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

Autobuild statistics for 2023-12-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  3  |  0  |  5  |
  2023.08.x  |  1  |  2  |  0  |  3  |
    master   | 54  | 25  |  0  | 79  |

Classification of failures by reason for master
-----------------------------------------------

        edk2-edk2-stable202308 | 2 
  gobject-introspection-1.76.1 | 2 
                   linux-6.6.3 | 2 
 Makefile:727: target-finalize | 2 
check-11970a7e112dfe243a2e6... | 1 
                  clang-15.0.3 | 1 
                 coreutils-9.3 | 1 
                 dhcp-4.4.3-P1 | 1 
                 erlang-26.0.2 | 1 
              fftw-quad-3.3.10 | 1 
       freeradius-server-3.2.3 | 1 
glibc-2.38-27-g750a45a78390... | 1 
             host-delve-1.20.2 | 1 
        host-sentry-cli-2.20.3 | 1 
                  jack2-1.9.21 | 1 
              libarchive-3.7.2 | 1 
                    ngrep-1.47 | 1 
        python-pysensors-0.0.4 | 1 
           tesseract-ocr-5.0.1 | 1 
             tpm-tools-1.3.9.1 | 1 
                 uclibc-1.0.44 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/07af980f5d4a0aebc6db7be998bedfcdcf26f615 | ORPH
  riscv32    |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/83d059e74b771aad1ed9db80a4f5572361fb3494 |     
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/524b927596f9fb863ddaf656ad1907aed13ae45b | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/0539300a779d2e7d12ada905b84f9fc52b963eea | ORPH
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/6b1f6d93f0d95bac178056a9a3f40d7400d63e88 |     
   x86_64    |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/ce6017b4828cc1ac48ff4db689bca326f3250bf6 |     
  sparc64    |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/1aace0ee738f8ec4aa2c9a739fc7535c3b6bf884 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/864693c7b59927bc5dce8b5cdc5501d93f1ae4e9 | ORPH
   x86_64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/cad77366646f0b26d96c279706e10a6f4541ca7d |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/0f3ffe3c955e9518f5601f6cdc65795f4ba09a9e |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/67e816c4d267cc455bd9ff9e47be7978c94f25e2 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f448a8d58790bae955958b702eba1e6062b500e2 | ORPH
  riscv64    |       host-delve-1.20.2        | NOK | http://autobuild.buildroot.net/results/59646b0d4aa2fb7175aa3d1dcd85993283a3061e |     
    arc      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/d5dd4a319342bc6ba1b13cef401bbd5283fd2cc1 |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/dc91395725bceb5b5de6d769a882baeca3657829 |     
  powerpc    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/c063f2616337daa03a661d77c5b40de96189df09 |     
    arm      |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/9462f4b36967a732bb89cf6dd36fd9c811669917 | ORPH
    arc      |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/18598ee791f56ff76f8d4dafc8eb4151015fb403 | ORPH
   armeb     | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/9bac5a1676f6cbba0e7fbbd017ac1fd90c398863 |     
powerpc64le  | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/323655d946ad5e2ad8234c7aed8920f0bd3dce05 |     
    or1k     |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/7f4882d331420a885574bdbced52af577f8ffb8c |     
   sparc     |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/3185af935a19789cc24215ec85f5e2872ae3047a |     
   s390x     |      tesseract-ocr-5.0.1       | NOK | http://autobuild.buildroot.net/results/46d3ffc8885245ee9a56a528be055b0b27a18245 |     
   sh4aeb    |       tpm-tools-1.3.9.1        | NOK | http://autobuild.buildroot.net/results/651e5db7b5eb11ae73d94e654cca77f62552130b |     
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/cbdc2a7eff73a8a2d881ae9ad1e6f04d6971b098 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

       freeradius-server-3.2.3 | 1 
              host-rust-1.67.1 | 1 
                   perl-5.36.3 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/505981c187c0da476d97ec924cc785cc5333ec1c |     
   s390x     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/c67dd8c398fed3d01f2222de64919e94bbbc31ff |     
   armeb     |          perl-5.36.3           | NOK | http://autobuild.buildroot.net/results/f0e0c2d58eca05c7d94105e9e4bf5b27ac0e829c |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

              host-rust-1.71.1 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/a2a33d9308d69cb73bfecc2723cbb2681dc342fa |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7706763afaafffa45d7f5436794162338b1391b5 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
