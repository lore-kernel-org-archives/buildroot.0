Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A7DC001B0
	for <buildroot@archiver.kernel.org>; Wed, 16 Aug 2023 05:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C4B041DBC;
	Wed, 16 Aug 2023 05:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C4B041DBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p5h4776CakkP; Wed, 16 Aug 2023 05:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63FA741DB9;
	Wed, 16 Aug 2023 05:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63FA741DB9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54D7D1BF407
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 05:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C17841DB9
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 05:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C17841DB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id arwMRfhfpttm for <buildroot@lists.busybox.net>;
 Wed, 16 Aug 2023 05:40:19 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4305D41DB6
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 05:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4305D41DB6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35F0E60005
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 05:40:16 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 16 Aug 2023 05:40:16 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230816054022.0C17841DB9@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1692164416; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IisDMZtEx5vQOqiLnguFE2dGekmg3tgvMBeK5R09k24=;
 b=ex1BwxP/UY1O3jPeSiSxB8BFAIOEb/uXo8Y4Moyq6WknElzIerXTiiuS/LskgM4KwNOfPk
 wFO0cDuOv9DkrOSU8m7Q27PkDdYeLIHsnuKgj1q+WkHWWdz6WnmnbLLgEAv5YRHBHtEIq7
 Hc7indRJBzdx+mcdzkVLPZvSLeTi1Be3fktfQgAX/iHzJUxVBGjTWYLs9HtajaNRGKjAoR
 wkZ1TdL+rPsgPPEYzgaeTtVcsXsZ3Oo/uS5t4UXgiumCuuZ/hO/qU2qoWfxEoYMVpBRCYH
 3nMBlaYhtMmTX3O3e/0kXUEIlTubCmeB+Ti55EDsiM9h8tlrtNvCZDS1SrCknA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ex1BwxP/
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-15
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

Autobuild statistics for 2023-08-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  8  |  1  |  1  | 10  |
  2023.05.x  |  8  |  1  |  1  | 10  |
    master   | 12  | 16  |  0  | 28  |

Classification of failures by reason for master
-----------------------------------------------

           dmraid-1.0.0.rc16-3 | 2 
              open62541-v1.3.6 | 2 
  binutils-arc-2020.09-release | 1 
                  boost-1.82.0 | 1 
                  check-0.15.2 | 1 
                elfutils-0.189 | 1 
              fftw-quad-3.3.10 | 1 
                   guile-3.0.9 | 1 
              host-rust-1.71.0 | 1 
         host-sentry-cli-2.8.0 | 1 
              libxcrypt-4.4.33 | 1 
                   trinity-1.9 | 1 
             util-linux-2.39.1 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/daa621728e087d92c37e1294c18d925b0bb4f2f9 |     
   arceb     |          boost-1.82.0          | NOK | http://autobuild.buildroot.net/results/fca45077c70d1869efc2dbd121c3d596999eebe5 |     
    arc      |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/bc631c563c1502f2027058b9a0dadce816e33094 | ORPH
    i686     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/e035c75607180610e901681c237a351c38f0bfff | ORPH
   mips64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/af7b75bd4e9a4f403aae126b7df1fdbdfbda99eb | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9075c711043eaff3cbb279229a6356e570bb8710 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/4f03302e1e12570a7f64fcced0e15bc9c3c22d62 | ORPH
 powerpc64   |          guile-3.0.9           | NOK | http://autobuild.buildroot.net/results/adb962babdedb70cb973cb48fb4f695d430adc8c |     
  aarch64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/115426388cd7f0e74fd6b9f01f69ffda0810fc68 |     
    i586     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/4959dfd767f833a6135d1275607ba3ee704267b1 |     
    m68k     |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/127820631a2ef620f59bf0a6b2bd9cee29b31459 |     
   nios2     |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/2aa1e2a2591ff7f5392faf0ebc721b7e7a53776f | ORPH
  sparc64    |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/fa521a110a420b916bc6c3e7be814f91ea356f96 | ORPH
   mipsel    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/7f9626827a315b54c42e49ccb0bf75f8b5ec971d | ORPH
   mips64    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/245ec6452c95a10f6bbfba2874bae540ef18ca51 | ORPH
   armeb     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/d156379cd5d14a5b13829eb7cead09f134aa2fb4 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

         gobject-introspection | 1 
              host-rust-1.67.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0c90b498780f75cee51da33c6751d8b79b498288 |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/02e315b87ddb251ea0e6881fbb18b21cd92988d2 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

         gobject-introspection | 1 
                libgeos-3.11.2 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4606c3f05f33ee0c0e63c9897f8aa4e6577a0076 |     
    or1k     |         libgeos-3.11.2         | NOK | http://autobuild.buildroot.net/results/a3657ee35ea671668b51ecb3dba35069bc48f646 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
