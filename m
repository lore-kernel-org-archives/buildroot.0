Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4E5C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 06:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB81281EA3;
	Wed,  3 Jan 2024 06:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB81281EA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tkhJFFQaXa_N; Wed,  3 Jan 2024 06:52:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F97181AF4;
	Wed,  3 Jan 2024 06:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F97181AF4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D20F1BF27E
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 06:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 312CD40503
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 06:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 312CD40503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZ0BDETwQ7S3 for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 06:52:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE45740125
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 06:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE45740125
Received: by mail.gandi.net (Postfix) with ESMTPSA id A085D1C0004
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 06:52:41 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 03 Jan 2024 06:52:41 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240103065247.312CD40503@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1704264761; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=n1o6CMJisI0h1CKehOaSbVOf5e6Kp2MS3hsFPnN62fQ=;
 b=f/cWp91lIOQi07A7MGNK/nEmWjifTLuKsYusqV1Kq9Id6RsncBgtyC8qwCT7QOYdL0pOgb
 fTZ7VVyo0RkmK0rQSGG7ASh349PnPVQubBZXtlnSRWsVFvileI/OCRrW/Vc6tlSNYBQKqh
 l4yA8jBqs6vtz9I60+iDOdkvdsORxRTkD9YXgvN95wj2zNh470Y0l3BDLl1UL7JMc4no86
 UAJz21Rc7U6Bue11pTAV/1Cqrh8ZYtKgxlKw0uw2ppLb5L2K4aPGs24kCTvlQUJtvmnbPO
 0XShWNetrvn4yyikObqYmOAjHUP7p7m0nM2WG0eHh2JYED6PRGsSIBYpser1Hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f/cWp91l
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-02
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

Autobuild statistics for 2024-01-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  4  |  0  |  7  |
  2023.08.x  | 10  |  1  |  0  | 11  |
    master   |  7  | 14  |  1  | 22  |

Classification of failures by reason for master
-----------------------------------------------

              libopenssl-3.2.0 | 2 
                libressl-3.8.2 | 2 
cegui-00b4e1fe174da53b7ed72... | 1 
check-11970a7e112dfe243a2e6... | 1 
                    fcft-3.1.6 | 1 
                    gdal-3.6.2 | 1 
         gobject-introspection | 1 
                libsoup3-3.4.4 | 1 
                   linux-6.6.8 | 1 
                nushell-0.85.0 | 1 
                 openssh-9.6p1 | 1 
               owl-linux-1.0.7 | 1 
        python-pysensors-0.0.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/b985f15ae9052e52dbd8d409635e857b31d24971 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/c4a6026bb81832da6d044b3d7077fc13de3cc5e0 | ORPH
    i686     |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/1b2dda32a90d7db8117eede09f46d44cffe60993 |     
 aarch64_be  |           gdal-3.6.2           | NOK | http://autobuild.buildroot.net/results/e258305b42dcfdbefec656015929c384444f49b5 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/f4fa604ca2788f77e8710c5a1b86601d65dcb7d0 |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/a272521d8b088a5881afc7b4008238f36a450752 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/77c5e13127de67a69782f138aa28c8b0ad951941 | ORPH
   sh4eb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/3c77861b70789931690c2a86e2b61ec90f37152b | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/15636f788a19ba346b2c302263aaed7229559566 | ORPH
    mips     |         libsoup3-3.4.4         | NOK | http://autobuild.buildroot.net/results/732fcd20c2998e7d7b6b8f61871ad104f8d243df |     
    i686     |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/ed4be425b1151fea1cb787b7cfe015fdabfb2922 | ORPH
    arm      |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/6275bbb9416b9e2f6dd6da95804251a7d1d5766a |     
  mips64el   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/8e45acce95eb8b230c10b59ea1288da820cc8a9b | ORPH
   armeb     |        owl-linux-1.0.7         | NOK | http://autobuild.buildroot.net/results/0bcb692f70fbc12294d2e85f1e1c8f6939471f90 |     
powerpc64le  |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/acd8583fb635ea27811405a2478182ddcd5642f7 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                     file-5.43 | 1 
             fontconfig-2.13.1 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/3db3e61203df71020a371d16424ebc94817fd6fa | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/705a43f09a92fb2d56bf120ef13e691f1b60ad14 | ORPH
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/ec91be81ce461a64832e5ed73c9feddfae24dd0f |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/e39657defcb44cefeaa5e870f4e60c6d18cbcdda |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                 uclibc-1.0.44 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/155a8cb4f1f1df0e7f2c27e237ad9ab30b01a21b |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
