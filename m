Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB1EC25B75
	for <buildroot@archiver.kernel.org>; Thu, 23 May 2024 04:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D1474061A;
	Thu, 23 May 2024 04:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHTmLJib6Fij; Thu, 23 May 2024 04:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9316C4061C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9316C4061C;
	Thu, 23 May 2024 04:08:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 474031BF3AD
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 04:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 409E540111
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 04:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdp06UAV5nz0 for <buildroot@lists.busybox.net>;
 Thu, 23 May 2024 04:07:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 37322400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37322400B9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37322400B9
 for <buildroot@buildroot.org>; Thu, 23 May 2024 04:07:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FA081C0002
 for <buildroot@buildroot.org>; Thu, 23 May 2024 04:07:52 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 23 May 2024 04:07:52 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1716437272; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OPnXVr9NwYezqT2b2K4hwDHkkHxQwtAs09QcxB2DXJ4=;
 b=nTPB3UcvcvqFKSz40XXTpIHe3hthLt/PHrfXtzqRp1S59CNWfoSMsYSj4BdQqKqEe/Roqp
 i83/tei8WtIpuTfPJG/QutoE85VlbsvPwHoYE+bcMH82CyZPqhRFIRn5qDxQ/Hd/OMnoUK
 0+o/jKYxbu+ospSuLBFfdLNlfAKvy/s1aP+PY00BbBbnDO8G0m19UH6AvT2RGZApYRI7kp
 2CLNhyERvf1L6f5aaKlrS/SIAhHZ98rX/Wk3kV5Z13x9Lurmfvt3ottE5OebxKlkNXNJZp
 MgXVhh5TIq+7/w4ZFXzLbkhzKIejNMJG5gR0o/5SkBK/QJUHYxpBaDQW0OdIUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nTPB3Ucv
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-22
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
Message-ID: <20240523040752.a9K4VWKuFL3UHGDUHhvebf0cT6NRlY8ntYteE9y8Fas@z>

Hello,

Autobuild statistics for 2024-05-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 10  |  4  |  0  | 14  |
    master   | 35  | 50  |  0  | 85  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
                fail2ban-1.0.2 | 4 
ibm-sw-tpm2-5452af422edeff7... | 4 
                  ffmpeg-6.1.1 | 3 
          libcamera-apps-1.2.1 | 3 
                    bat-0.24.0 | 2 
                 coreutils-9.3 | 2 
aer-inject-9bd5e2c7886fca72... | 1 
                   bird-2.0.12 | 1 
                  boost-1.83.0 | 1 
             containerd-1.7.14 | 1 
                    fcft-3.1.6 | 1 
               freeipmi-1.6.14 | 1 
             gnuradio-3.10.7.0 | 1 
                 highway-1.1.0 | 1 
         host-libxcrypt-4.4.36 | 1 
               libglib2-2.76.1 | 1 
               libunwind-1.8.1 | 1 
                libvips-8.10.6 | 1 
           libzenoh-c-0.11.0.2 | 1 
                 mesa3d-24.0.7 | 1 
                 minisign-0.11 | 1 
                     nut-2.8.2 | 1 
                  octave-9.1.0 | 1 
                 pixman-0.42.2 | 1 
               poppler-22.12.0 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
                    proj-9.3.0 | 1 
         python-remi-2022.7.27 | 1 
                    qemu-9.0.0 | 1 
             strongswan-5.9.13 | 1 
             util-linux-2.39.3 | 1 
                    vlc-3.0.20 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/2d92ab6e2e7218bcbc9b58dd3a79abc004c33773 | ORPH
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/fd17ac7c6e1d3466c8714c2ce1355335491ac941 |     
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/2e6fd3ad46e06719543185c554ba147eb3353a70 |     
    mips     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/a1b8da6ce84cf0c3e9cfd3efa749ed265a10ca47 |     
  mips64el   |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/36811c427808c1e37ec81b4c761592691f27e139 |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/668651cb1757eec7013a709c7b13a8e53ec9eb82 |     
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2b00cde26a95d50a4a7e94499f4b4ce39244b376 | ORPH
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/6121a203f4dfed73507019115be19fa6343206c4 | ORPH
    arc      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/7d3da6db439d41cae5339f6e53d026774bcbd8a4 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/195787292473b7834016010207e81e2fb2834657 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/5043470ffa7eee80a8dd2402d181e3ac1f5c87f3 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/fca3601ac7a193ab874febcbc3c208c11e53222a |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/1fb0d698710f6907c194642a668bdc30a7f1095b |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/fd22d37364eec6c048bd9b27f45484c228e878c6 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/97ad9594c47299cc2ffed743df883e45acd895c7 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/9f224f63ce11811b202642e6f9cee88053c691b0 |     
    sh4      |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/de0cbcf0c278b8a8bf6d3bcde8b4f53bd30cb409 |     
  mips64el   |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/e0c1b6540f52afd6c80f07cf6118c467761070fa |     
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/4ae39818bad2484fd6d096b78267114b214bc2e1 |     
    mips     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/39f9366d6b3d1a7d0fc703ed5c274b851f791f22 |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1a0043d9f83aaa4abd7aef26817279b95050bc14 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a8d9aedbe675ea3bab03cb53950099868cd051b4 |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2e88865be0a0e89b658c99cbc9a8ee664827859a |     
  powerpc    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/3271da1a62d471e8a7b9523a827f1947776639ec |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/0182a9379adc700088d55d35e39c80a7859f3d9c |     
  mips64el   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/685413156653d4f0eea9be7cd8dac62c3a3121a3 |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/a134e66f5663a1667bf82c0c9a0fd09ec991ce65 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/deff50c99cb8c877b12bea76f9281f8f52e555ca |     
    m68k     |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/0f1d5c4cc55f64b040193a7419cc0fe5fb2cc28a | ORPH
    arc      |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/e0edfc4170ed3a1e8cbaa0a24f50439866352a1f |     
   x86_64    |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/8c42caf343bf98e8b208ba71309b8e830740af03 |     
  powerpc    |         mesa3d-24.0.7          | NOK | http://autobuild.buildroot.net/results/6ed0e86df0c0ec9d158c299684123596b93c3a00 |     
    m68k     |         minisign-0.11          | NOK | http://autobuild.buildroot.net/results/deca8b4c3f97964283dfada2429fdae7d30b8ad0 |     
    arm      |           nut-2.8.2            | NOK | http://autobuild.buildroot.net/results/fe9d6e0105119c1d0fc1eaa36af0f522b095fc4b |     
powerpc64le  |          octave-9.1.0          | NOK | http://autobuild.buildroot.net/results/509885d7c670ab8e30f73a61ab94e15bf4252931 |     
  riscv64    |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/88f6e2400aa6c77fc1a4c9157225ca3cac52907c | ORPH
   xtensa    |        poppler-22.12.0         | NOK | http://autobuild.buildroot.net/results/173b5395b6de76bc7e63cd19fc3e88ff1a36a7bb |     
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/e03a0972623c7b464acd82798871db6dcfa57456 |     
    mips     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/f118ab08534a3ca4304eb47dd98bbb826946c82a |     
  powerpc    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/3a80f382bcfe2703098eca9ad8c3cecd4d9150da |     
    mips     |           qemu-9.0.0           | NOK | http://autobuild.buildroot.net/results/cb16d2dd259a31a86beef5169cfc46b9fdcbe3a6 |     
  aarch64    |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/42f84bb8d599fede2a0b576ceb8542124417cfe1 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/56c1dd8864ba79d804c761dd9f8ee69039ceb944 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/2dc9e19e8a342fb5b286f2f85b9b04c55dfd05d6 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/dc4b59a64a2e5220571407d72d3cd0e5e53f4173 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/de6571b269298d2794256b806a60f9b0f6707998 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/d252da9da6068b22924420cb5f49a58744d2e47d |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/df371a4f3942be53bf604e021d61144e61bee4c9 |     
  mips64el   |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/b25920cf97eef1a9c151b6b86f0a5abae20c8211 | ORPH
   xtensa    |           vlc-3.0.20           | NOK | http://autobuild.buildroot.net/results/58708ee2e1143bacd8653d18cf9da434db33ab12 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 coreutils-9.3 | 1 
                     crun-1.12 | 1 
             util-linux-2.39.3 | 1 
                    volk-3.0.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/1f87900c9941e7e3cc824c0f8a7c564a0c7033c1 | ORPH
    arm      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/724a261f0a8d41d7d12c357661ffa89edde438e7 |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/e0bb892a86e1155b54ecd893a4ede0185d8c61f0 | ORPH
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/cf818e792961f355904a915f46df07d2f4385bac |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
