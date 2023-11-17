Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5552BC072A2
	for <buildroot@archiver.kernel.org>; Fri, 17 Nov 2023 10:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEF8D6FB00;
	Fri, 17 Nov 2023 10:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEF8D6FB00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OY5TPNIoGVrH; Fri, 17 Nov 2023 10:46:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F331A60ED9;
	Fri, 17 Nov 2023 10:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F331A60ED9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2BFA1BF580
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 10:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7027F41F77
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 10:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7027F41F77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZSEjmHV6DTBL for <buildroot@lists.busybox.net>;
 Fri, 17 Nov 2023 10:45:58 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB66E41F71
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 10:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB66E41F71
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6829C000B
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 10:45:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 17 Nov 2023 10:45:54 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231117104559.7027F41F77@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1700217954; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aKTE+gdsvtCOI5LuKbRjQ32EOgsSDG67OCW8RR48ZjI=;
 b=M9cZiOv/xCpVBIunIv2gDNxC9Ax94C6POkN4ggOeP5e1l/c2GbeiQ21clwrg5OxPOshBIV
 Zf47R4GY4IaSnjuI00roMgt5v72huIEp8QS4RNG+yXSxtuc3qCzfRkNVPkHCqaCJ6yFVmO
 LpmcFkwp5K74AXkn8h8ISAbyfZiFjV6ya/sxg0haH4iY+1gUZwjDo314MSBzlN7OmJ1hy7
 ydy1OAh+4CKkfYsGVUOOU8EXcGdyXrlLMTgJq9wT/E3CK6Bjl0wXSIBizihlXMsZzyXE5W
 spQMEH1T01pNrc8janknzKTZvMY4hhO1/8l57AdEu+wjoM/ACF7lczBzofspNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M9cZiOv/
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-16
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

Autobuild statistics for 2023-11-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  2  |  0  |  6  |
  2023.08.x  |  3  |  4  |  0  |  7  |
    master   | 14  | 14  |  0  | 28  |

Classification of failures by reason for master
-----------------------------------------------

          python-msgpack-1.0.7 | 4 
  gobject-introspection-1.76.1 | 2 
                 dc3dd-7.2.641 | 1 
                     file-5.45 | 1 
google-breakpad-c85eb4a59b6... | 1 
              host-rust-1.71.1 | 1 
          libcamera-apps-1.3.0 | 1 
                libselinux-3.5 | 1 
          ncurses-6.4-20230603 | 1 
              sdl2_mixer-2.6.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/9211e0d54bf6b98cc6d415dc09f6f8cccb46d42c | ORPH
    i686     |           file-5.45            | NOK | http://autobuild.buildroot.net/results/b20991b2f076e0ec4d017f0736a15acd46f30ac0 | ORPH
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d95cd44e7bde633e30d925a06098843286796877 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/df23e4289173df4b0c734576f42a0a12a2965206 | ORPH
   x86_64    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/077d05992085cf70a7c8823da22660bd9d140803 |     
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/02e76f5fc52f735ba61fe3f29e83a4c3e73bf7fb |     
powerpc64le  |      libcamera-apps-1.3.0      | NOK | http://autobuild.buildroot.net/results/e8e696457d066b83123f3fae2d9cc25fc9510a92 |     
 microblaze  |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/cb89e08edd775fe8181164eec3da4814a756e771 |     
   mips64    |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/2e93d9e6d59471e4b2768c2bceb0a8133af8f6bf | ORPH
   s390x     |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/67952d0b850fdb10dba53c4a4019ee1cb26f1f97 |     
 microblaze  |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/fba68e22fac798a68f0587b056c9646e51e24372 |     
   nios2     |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/c0d6f1155ddec2ea19fc9fd66be9370af805fba5 |     
 aarch64_be  |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/f8833276ae4447cf2c6a76bb7e8ed624dfbe0e0a |     
   armeb     |        sdl2_mixer-2.6.3        | NOK | http://autobuild.buildroot.net/results/c74ffbeb8a56cdaded67faf283ea626a467f8b13 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

       freeradius-server-3.2.3 | 1 
              host-rust-1.67.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/0a29fc96a2e24a60a8a7d10b43634cf36976a564 |     
   s390x     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/60112af409e8b86d69617f331d1a754ca702c378 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

glibc-2.37-45-gb4e23c75aea7... | 1 
              host-rust-1.71.1 | 1 
         host-sentry-cli-2.8.0 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | glibc-2.37-45-gb4e23c75aea7... | NOK | http://autobuild.buildroot.net/results/c5fbbd1fe14fe10e77f90c061bbfba192860de9e |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/c194bc81e8e6c8662cc3262f86dc57fb066bd49d |     
   arceb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/dec58f26ee29268c69b4c5d5a2a1af2bdff062c8 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/6452511bd3090f6192225fa36c9f2a80d7ede0d2 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
