Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C40C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 07:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85371824DF;
	Sun, 13 Mar 2022 07:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BLD7ffz-vDca; Sun, 13 Mar 2022 07:07:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B9C981C67;
	Sun, 13 Mar 2022 07:07:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 139B81BF589
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 07:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02D24409A7
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 07:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-GIE9t_Gzqf for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 07:07:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 279FE4099F
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 07:07:14 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E0879E0005
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 07:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647155232; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QFxzrNw78CqnU640P3d8nd6ZZ9TpvSEcoY42f0SQPkw=;
 b=bVUEHKFUXmS98cOsgIkpHmpydCYJVeCr0AdEuRk6Ahivc92BSucjYcPuthvWQfLCqnQtVl
 b4wIuEcpNsKLNp2x32bFQdG6prQVSTFl8NU7v+RUySpX7AEdf/YTay4qZUx6SEOkbBSMhY
 DK0RyuI2u50pukutnSL2/uzpsmBMTFAlpGpp7vAtnaflJmTy933cq1c/Drzie2WEsnInxj
 pgiZriyZ5Ug02In5i6NG2H0u+BJn5fEMCcNFDTFUTR7PBdy4uspl4xDP9apSBVA5aCUXkh
 ZTSZQCjh3Q4oeIq69pa0PpkyG1XP3II2q7QHUK2fNZM+zDz1vJ0xiwrOso3JvA==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 07:07:11 -0000
Message-Id: <20220313070717.02D24409A7@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-03-12
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

Autobuild statistics for 2022-03-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  |  5  |  1  |  0  |  6  |
  2021.11.x  |  2  |  1  |  0  |  3  |
    master   | 22  | 14  |  1  | 37  |

Classification of failures by reason for master
-----------------------------------------------

                    ola-0.10.8 | 5 
             bluez5_utils-5.63 | 2 
                  bind-9.16.26 | 1 
                  exempi-2.6.1 | 1 
              host-delve-1.8.0 | 1 
  libnetfilter_conntrack-1.0.9 | 1 
                       libuwsc | 1 
                 mesa3d-21.3.6 | 1 
                  uhd-3.15.0.0 | 1 
                    vlc-3.0.16 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/ff816a15507e195e74208e59900f25153c94cc7b | ORPH
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/88b9f653cd5ba4d6a3e2be327cb3bf2adca56565 |     
    i586     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/4103142f6e6c0b29b3d15011f995f68513178ba0 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/8addb3ab2f8e19552865ae566e93870281fba2ea |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/f61914fcf0c363d819e8b189d781baf3ab9c60d5 |     
    arm      |  libnetfilter_conntrack-1.0.9  | NOK | http://autobuild.buildroot.net/results/19931aba8bee8867a53130ca4a53cfadbc4c5bfd |     
  mips64el   |            libuwsc             | TIM | http://autobuild.buildroot.net/results/7fe48d5d7da3e26410b839557756108fe953e4c6 |     
   x86_64    |         mesa3d-21.3.6          | NOK | http://autobuild.buildroot.net/results/617e3e63afc837150af50d1af46d0ad067b2d2ca |     
   sparc     |           ola-0.10.8           | NOK | http://autobuild.buildroot.net/results/80a222df03acc700b3a2ca7699cba63090b8310c |     
 powerpc64   |           ola-0.10.8           | NOK | http://autobuild.buildroot.net/results/8b3485c5cff8ad4046f26c934ab6dc84ec8d0b5a |     
    or1k     |           ola-0.10.8           | NOK | http://autobuild.buildroot.net/results/c49d30f151db17e740189140089df813e9e0e740 |     
    i586     |           ola-0.10.8           | NOK | http://autobuild.buildroot.net/results/ec33c1036a81158f5190e6c74bb03743c5d45cca |     
    sh4      |           ola-0.10.8           | NOK | http://autobuild.buildroot.net/results/1fa46537748ecf46f09521ee71818fe3b1a1eeeb |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/502ec0be78adf9fc15b39aed63de419324398882 |     
  mips64el   |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/1690c11549764f65520aafc93b32ada8b4e9b832 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e4b2506d4e6839dfd32ff86fa817a740d87952bd |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

               libtheora-1.1.1 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/8589c5fe8c1f61604b166a1dbbf0fe3288cd66f2 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
