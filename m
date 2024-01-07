Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A68C47077
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 07:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24E0B83CE3;
	Sun,  7 Jan 2024 07:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24E0B83CE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YLYR_h_wSQVM; Sun,  7 Jan 2024 07:10:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2523783CE7;
	Sun,  7 Jan 2024 07:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2523783CE7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECB2A1BF2B9
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 07:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C01C741C2D
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 07:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C01C741C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKomDSg6Huxq for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 07:10:41 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68B5F41B71
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 07:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68B5F41B71
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97D4320007
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 07:10:37 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 07 Jan 2024 07:10:37 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240107071042.C01C741C2D@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1704611437; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ixi8xCSMNZazCqbm4GYnuDEtvBaME447jurpQ4MK8F0=;
 b=cKT33eVShmVxTG2nNgvtLzrGC2+HCbV/K6Lt420lb/Gm5MYGTehBQ6qtOfxaVNT27p+gDP
 nJe+UBFdhFmh0ekfg0OvUfFIc1CGdONg10lpctI2mtT5kWnNxuPGPtbcdG4BEq+XfGqOXB
 4Y4RExPi3lcJjjXuWi4GcmK0XRulM03ifB7KY7PLAwgG151aTNh7DUVi6IhZrtFQCHafyz
 q6bUz5V4ebbSnUgVVKapYN/l9VUcizyEyckmJOGZtQj0LUgbibgs7NpgWJozU6ZQOpY51I
 3JVl4nxUakdb0AJsmknA1XrfibW/hVWphbiQtx4y0+Q1gim7FO5M6wNsixl0VQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cKT33eVS
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-06
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

Autobuild statistics for 2024-01-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  2  |  0  |  3  |
  2023.08.x  |  4  |  2  |  1  |  7  |
    master   | 59  | 56  |  0  | 115 |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.6.10 | 5 
ibm-sw-tpm2-5452af422edeff7... | 4 
                   exim-4.97.1 | 3 
          python-grpcio-1.60.0 | 3 
                  stunnel-5.71 | 3 
check-11970a7e112dfe243a2e6... | 2 
              libopenssl-3.2.0 | 2 
                libressl-3.8.2 | 2 
          linux-5.10.162-cip24 | 2 
                nushell-0.85.0 | 2 
                 openssh-9.6p1 | 2 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
bayer2rgb-neon-15feb1115b48... | 1 
                   botan-3.2.0 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                    cups-2.4.7 | 1 
                 dhcp-4.4.3-P1 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                elfutils-0.189 | 1 
              fluent-bit-2.1.7 | 1 
glibc-2.38-27-g750a45a78390... | 1 
         host-gcc-final-13.2.0 | 1 
               host-runc-1.1.9 | 1 
               host-wine-8.0.2 | 1 
                libselinux-3.5 | 1 
               libunwind-1.6.2 | 1 
             libutempter-1.2.1 | 1 
       libzenoh-pico-0.10.0-rc | 1 
 Makefile:727: target-finalize | 1 
                memtest86-6.20 | 1 
                    php-8.2.14 | 1 
                    pppd-2.5.0 | 1 
                python3-3.11.6 | 1 
             sofia-sip-1.13.17 | 1 
             strongswan-5.9.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c8a29d366952551ff8be625b4ff275df167c5520 |     
  aarch64    | bayer2rgb-neon-15feb1115b48... | NOK | http://autobuild.buildroot.net/results/307c1c448becd99dfba3a17b3ef816db0bb5cad6 |     
   armeb     |          botan-3.2.0           | NOK | http://autobuild.buildroot.net/results/6b311e97484db2b0f8adbda140320d696713b1e0 | ORPH
    mips     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7cf2c6cce59da87737b2939c091d6b07c2150de3 |     
 aarch64_be  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/34ec74f974f9c9e5e47f8a918b0bab76bc32dccb | ORPH
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/88b4e1e0670ef7b48678fa003a100fe588693886 | ORPH
  aarch64    |           cups-2.4.7           | NOK | http://autobuild.buildroot.net/results/82e49909d4fcebdb781dcd60e9d10eb59fb6e7de |     
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/d9bdba75b544a8fa4faccc5ccadbf48e676c5b05 | ORPH
   armeb     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/d947007e0bad351569d5fdbe1284dd459417d649 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/96b46480584e0d9c114752eb01596e08df7861d8 | ORPH
    arm      |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/fcdebb741616414279fa1918a3e56e09fe61502c |     
    m68k     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/443d607f409ff228a3e90979f2cbd84a5a163b9e |     
   nios2     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/111302dc3b4763befe9b159ae59b1b72de9162ea |     
    arm      |        fluent-bit-2.1.7        | NOK | http://autobuild.buildroot.net/results/91e967ed944ab5099c23dd9fbac3120944609b47 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/b060c4938f995933fb55d7003d0ef10c41d61121 |     
 microblaze  |     host-gcc-final-13.2.0      | NOK | http://autobuild.buildroot.net/results/70eb85f054dcfd8d2fe279ac908650d2281f2a66 |     
  powerpc    |        host-runc-1.1.9         | NOK | http://autobuild.buildroot.net/results/322cd6ed7ed4ed6067bf924b7f87f6ed47b6e472 |     
    i686     |        host-wine-8.0.2         | NOK | http://autobuild.buildroot.net/results/6875b043d5f39bf9e10308340068ea2ad470d63b |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/67b80cffbf635e4cf23e3a8e4b066140ed5a497c |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/3192a8ade96992bf3f25f59b1e0f227da12927de |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/290509da3b9c60a76acbea73f9f5a9d46f366dfe |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c00c8e2800d1f8dca774e6e5dddd47cd210b1470 |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/986cb07d368c7214ffbc9d60c378e7ac00797f00 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/95f4bf19d7af42808816907a4b3f450ea0ed67d5 | ORPH
   xtensa    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/9c2c60e1166739161266dddda83a5c20602c761a | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/956a0ec3563ec53b334cbd2f90f6122aae6c4c44 | ORPH
    m68k     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/d9744c79e96d2ec542b815728752ea7e4c828b5c |     
   mips64    |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/9a4210cf09204feba6072dd674fbdead5db85992 | ORPH
    arm      |       libutempter-1.2.1        | NOK | http://autobuild.buildroot.net/results/781ab393455f0e6823b850f474f6fe38b27d8efa |     
    or1k     |    libzenoh-pico-0.10.0-rc     | NOK | http://autobuild.buildroot.net/results/fd0b2c666a1dc1537162d15b27743abd270243ed |     
    arc      |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/e8e8dd1a11846e46e2713c91cb00277b9899e20b | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/555a06e08d8c98f449dd67de877997c6b278eeeb | ORPH
powerpc64le  |          linux-6.6.10          | NOK | http://autobuild.buildroot.net/results/a9c6d004d128bae7ccdae7dc4477c0829e9e9228 | ORPH
  aarch64    |          linux-6.6.10          | NOK | http://autobuild.buildroot.net/results/8b9ae732f44b8a73e140efb456ad1114315c5ecf | ORPH
  mips64el   |          linux-6.6.10          | NOK | http://autobuild.buildroot.net/results/33f3c9190244962be8f53678b95b14708506d421 | ORPH
   nios2     |          linux-6.6.10          | NOK | http://autobuild.buildroot.net/results/f7f2ccf220c28d94419d71cfbcc4a3fef18e9a8c | ORPH
   nios2     |          linux-6.6.10          | NOK | http://autobuild.buildroot.net/results/761f4f8fa9c93e25e14d1191be465fbbb50eba1f | ORPH
 powerpc64   | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/1f30f1d7eef0a86182824d95f5cbcf0b4379730a |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/443f569e1f3bfd8383f72d384a8fab6775da254a |     
  sparc64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/e8a88dbc342490653a052681b5807a92e9359843 |     
  sparc64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/f9f0287a8e39c65895014ca513ed25071f020add |     
 powerpc64   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/c36758da43f1f26417742a95d36e0db7a83ccc04 | ORPH
    mips     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/9a23563468fbd17a7fb212b5a43ec8cff1222d9b | ORPH
    m68k     |           php-8.2.14           | NOK | http://autobuild.buildroot.net/results/271f9fb8bfa5ba2f74feef81e6b375b54e21cece |     
   sparc     |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/1d18f0ae7edf0d0c2c11b1368627f3bc4591045f |     
  sparc64    |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/58ac25b4e426712269c5fc144121c955b714c760 |     
   s390x     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/b439e7f339c85bb09264f9df2018c1959f082348 |     
    sh4a     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/62ec863e886541067c0b505c56b05292a6ee36f6 |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/927ea77688e2a484150eb6128ee236a7555f1f0d |     
    arc      |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/b503ae7578c1b61c266ae67a3ddfed1f560df8ad |     
    arm      |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/3936433b2867e54ae30092a640a4c87cacefbe09 |     
   mipsel    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/1707beea413a8da8713ad2dc59db947329da45d2 |     
    mips     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/1950e2ba702e32323be7c7e4056d70b9f7d52837 |     
  aarch64    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/756973197d5d67fe2cebfe52560e3f8b65540488 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/67310c8e15406d58372b8369baf1851f5684a353 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/fe94cfa1a7b3a0302b6edd56f3f20a7c913e3db3 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-runc-1.1.7 | 1 
                   json-c-0.16 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/fbbdfba18d437db05a58011a3ed34c24fcb93676 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/1a9e7308e7a2a8562348a93e0df56fa96463bed5 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

         gobject-introspection | 1 
               host-go-1.20.11 | 1 
                  linux-6.4.16 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/693345eb1ac603d099f9035aaa84cf2457be1fbd |     
  mips64el   |        host-go-1.20.11         | NOK | http://autobuild.buildroot.net/results/6d683f2f1a60103eb982251c93b96f3dd96afd71 |     
   xtensa    |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/2ae7e11cc73e05e2638673af35f5d703c7f62165 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
