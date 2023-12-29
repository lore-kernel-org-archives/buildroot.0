Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75465C46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 06:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC636400FB;
	Fri, 29 Dec 2023 06:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC636400FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4wtg6nnYResa; Fri, 29 Dec 2023 06:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F2E340184;
	Fri, 29 Dec 2023 06:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F2E340184
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F32B1BF847
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 06:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBD424094F
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 06:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBD424094F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PFWMIA8gn98C for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 06:40:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD1D340922
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 06:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD1D340922
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC19740008
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 06:40:47 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 06:40:47 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231229064052.EBD424094F@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1703832047; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RbKANFdANEi4cetZRtcJB6EaeclZe3lzmROkaww7BEQ=;
 b=aq3mcTfkKltlE8s2vxjNdtVcqPOX05r08BVt0qtZSgqivyydmwimmURd2znJmSygJZ1OWM
 ouOaDRdoNixg4PqI0ZFaHODxU2eJWNTIGDGWkK7ZbMa8QDaQopAY2qRtF4q4mIcdFKza0b
 wJp7qCYiqI+OuyQYkrZF9pLCV57pAGM6SNUkVEW+9b92wdb3nDx+nPwIdz9qj+jpKdl7UB
 JbpbRnh1gyXDlsB1VAeVHXRgGkPBrTUriKg0simFO6lraXfXZp5AX8raJx0Qkj6wozbvbQ
 cWWy8/r2IiaArDEf32deytRYRO2aWlyPhZwQEI+oB4R/PDfRCNaLgvmLtHyaqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aq3mcTfk
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-28
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

Autobuild statistics for 2023-12-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  4  |  0  |  8  |
  2023.08.x  |  1  |  3  |  2  |  6  |
    master   | 10  | 20  |  0  | 30  |

Classification of failures by reason for master
-----------------------------------------------

                     exim-4.97 | 2 
                   gupnp-1.4.3 | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
                       unknown | 2 
cegui-00b4e1fe174da53b7ed72... | 1 
                elfutils-0.189 | 1 
glibc-2.38-27-g750a45a78390... | 1 
  gobject-introspection-1.76.1 | 1 
              libarchive-3.7.2 | 1 
                   libiio-0.25 | 1 
              libopenssl-3.2.0 | 1 
                libressl-3.8.2 | 1 
                libxmlpp-5.0.2 | 1 
                   rsync-3.2.7 | 1 
                   sdl2-2.28.5 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/eae33ec067f208454033316af6febfcd562f39f3 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f8d20329b79bca54a2cabe6ee843a8362a594ee5 | ORPH
    arm      |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/d0b1e9b847d8ddf27a3ffda552089b3176d543b9 |     
   mipsel    |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/656defb75c159ccafad969e559c62218a34166c0 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/ed5e59bc919188d1d0e0cdb699f3cb3cabeea329 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d66c52bab019397263c34a764e0cf9d3911d02f9 | ORPH
powerpc64le  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/10c4429b7fa0e2b89662071a538f05da801f573e |     
 powerpc64   |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/e0a6899470be3c0834838b46008686cc22fb6576 |     
 microblaze  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/783bafdfd2fbc06d78a181f970117aa30a4afaca |     
   sh4eb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2a52c19370f8bd1f9b08a51d403275b7e5314e52 |     
    i686     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/0c79c93e1845ec081ae5ad7406c6517fdbe9328f |     
    arc      |          libiio-0.25           | NOK | http://autobuild.buildroot.net/results/f97c2db33e07a02699e4650caf97de5f3c475eb8 |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/c34d23a78d021633fc9b20ef7c910f600edcdc0b | ORPH
    sh4a     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/5f093368b87d805b7f7086b7aa50d4331480b90e | ORPH
  sparc64    |         libxmlpp-5.0.2         | NOK | http://autobuild.buildroot.net/results/f3cef04950eeaa744ebe9409561d505606375787 | ORPH
 aarch64_be  |          rsync-3.2.7           | NOK | http://autobuild.buildroot.net/results/6c1636f7556e7370a4c9f6d02c63cf3e20dc985c |     
   armeb     |          sdl2-2.28.5           | NOK | http://autobuild.buildroot.net/results/432ee50e38e3028f5adc5bb0a61973d220a0fbc3 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a86963352a268c3d0c1702d6099ef289d0ecf183 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/2f37c88f1f533c5eb826c99891281586bdad8864 |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/3b9208bf43e3a7689871a648ae56cd48e92451e3 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  check-0.15.2 | 1 
                elfutils-0.186 | 1 
               host-go-1.20.12 | 1 
                 uclibc-1.0.44 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/b4fa316a140a60851ca9dd2abdfc5b8a452a949c | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/613cacc598c75b345288f5340f2170e0ff1451dc | ORPH
  mips64el   |        host-go-1.20.12         | NOK | http://autobuild.buildroot.net/results/2a4e060b4ec88faef782c83f34c285957d1fb75c |     
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/876348289bd62d8b0ea4b112779e78dedac1ad05 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                       unknown | 2 
                        ffmpeg | 1 
         gobject-introspection | 1 
                    php-8.2.12 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/e5563e52c00f570588b1b858180166b0dabbd0aa |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ffb18a01eef5a4d7fe77a224dc1df2a37e389d06 |     
 microblaze  |           php-8.2.12           | NOK | http://autobuild.buildroot.net/results/6f9307a722b4ca9e404713c6be13d9e7f17c6a0b |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/d069cc3d7f9aa37565063d97a3546bdab9c00075 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/afb819b6e7063eff942a5868650b6cf892229a1c |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
