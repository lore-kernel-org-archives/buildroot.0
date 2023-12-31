Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C29C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 06:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77F3E41523;
	Sun, 31 Dec 2023 06:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77F3E41523
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfh1vd7ZIJYj; Sun, 31 Dec 2023 06:46:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F3944156C;
	Sun, 31 Dec 2023 06:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F3944156C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42CA41BF3FF
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 06:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6CAA82142
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 06:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6CAA82142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKjh49I_Di4P for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 06:46:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C227E82140
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 06:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C227E82140
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50FD9240006
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 06:45:57 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 31 Dec 2023 06:45:57 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231231064602.C6CAA82142@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1704005157; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bcJMrDKGz/vmHwhVumiTONRn6yTQmkrm9aUwMdbnZaQ=;
 b=En2FkwrL8ZE3QrDy0LBQB/SLOFF/eN3AWZc3nHJs1YGjfK9Z/n39l3AJjq0AkWFu3ks4nI
 lFgNlvRpVbTcjwtndrLc1/wVDeBvZFY3acp3di+Rc9k04CB/jBNJlYWxylIAg32nsUoLLH
 SwTvElCnRw+jLE+urhw+Jze6mijPaAgQKZYKHIEHLMYgMcKYp25dNoi7ve+IOKlws5Yu9i
 ij2LITGnyFF/udgzIbFxgaLT2+/FIg/aHhw+JZfaBzfFSnrxdx+p8P5E2M14PmGybhm2qf
 Su/XHWnQQDvrrGRTkrnn5K79iPjU+w1uY/vaVn0L2iibhVkEYnedK9GXf/6D7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=En2FkwrL
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-30
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

Autobuild statistics for 2023-12-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  6  |  3  |  0  |  9  |
  2023.08.x  |  3  |  5  |  0  |  8  |
    master   |  9  | 22  |  0  | 31  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 3 
              libopenssl-3.2.0 | 2 
  binutils-arc-2020.09-release | 1 
check-11970a7e112dfe243a2e6... | 1 
                 dc3dd-7.2.641 | 1 
                elfutils-0.189 | 1 
                     exim-4.97 | 1 
                    fcft-3.1.6 | 1 
              fluent-bit-2.1.7 | 1 
glibc-2.38-27-g750a45a78390... | 1 
                   gupnp-1.4.3 | 1 
                host-go-1.21.5 | 1 
              host-rust-1.71.1 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
         libmodsecurity-3.0.11 | 1 
                libxmlpp-5.0.2 | 1 
 Makefile:727: target-finalize | 1 
                    pppd-2.5.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/0db9d707d43fd2f12b99bdf67029e9ab1a0fdb5a |     
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/fb97ba5538c92bafc51182dff6d773fde8946ec8 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/8d1e6eb0b1fe579c6a914e13d6919d6bee7bbee4 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/193392fa6e57eb85616219a7b1438561f8a2d446 | ORPH
  sparc64    |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/c5c2496d22392411dd58e3cc23a7d5e089bef0fa |     
   arceb     |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/5f03bb5c0c107a2b908be974421ae0a032d4dd89 |     
   nios2     |        fluent-bit-2.1.7        | NOK | http://autobuild.buildroot.net/results/ec5ceca16ddcedf13a2b771866124b01b1c40b03 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/283c52c580c92bdf1ee23cc93c48636207384312 |     
    i586     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/7080d0419f48385e8643b212b3d8acb6e9bd2ee2 |     
microblazeel |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/8f6b4c3d3224f47866e64479381199fde0f8c634 |     
    i686     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/8735241edf6ae2a187d51fc8ea4e98e35866e054 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6879700f671237db651e7cb4e3537407ddccc6d3 |     
    sh4      |     libmodsecurity-3.0.11      | NOK | http://autobuild.buildroot.net/results/d6749bacf6c7c04a74e136585d36bc731716f6fd |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/5c8def1e001712ada3afc8eb9406cd4bed8d943f | ORPH
  riscv64    |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/4328c025f6f2bcd2ebc5a4368c78e00da0aea1ae | ORPH
   mipsel    |         libxmlpp-5.0.2         | NOK | http://autobuild.buildroot.net/results/1c409ec13c0a3faa9de7efc561f7fd9ac059f349 | ORPH
    mips     | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/ad53a091029fe475cb05fd204a501109d26f50c0 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/dd6c3ddf2eb00ba0e04c1ba97e679e4d17f77fb6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2cf045f45183a711de6e076e40e306e4982cb6e9 |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/1cc32fb91a97b5524023fb066d6b159770dd492c |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/37d880d0a15e589852478c4386253a98f6fa785e |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/091584cc10c3c170a800afec27827823444c7823 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 1 
            host-binutils-2.38 | 1 
               host-runc-1.1.7 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0fb9ef863c5d2b3a578d7f699e668fe8b28359e9 | ORPH
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fb7e105c8c2d9447b66e0e7d61a9d420add47c1e |     
   mips64    |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/0f55425f0ff7b3edd4e8f5e93b8e14bb040d4765 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

               host-go-1.20.11 | 2 
              host-rust-1.71.1 | 1 
                  linux-6.4.16 | 1 
             util-linux-2.39.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        host-go-1.20.11         | NOK | http://autobuild.buildroot.net/results/95fd9fe4615b8232d329b84eac2b52c6d146e0ac |     
   x86_64    |        host-go-1.20.11         | NOK | http://autobuild.buildroot.net/results/237962af37d7df52e307d568130a2d87d0ac5d7d |     
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/063feba8a76eb55d5087bc1ff6f81cf211274fb4 |     
    arc      |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/040c42f1183da9bbc4f972509ffba65ce6f9e97e | ORPH
   mips64    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/e25777310ec79a6aa16f399194a6cdce2838268e | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
