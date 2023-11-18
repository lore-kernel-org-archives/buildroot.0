Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E960FC2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 07:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CB4B821C3;
	Sat, 18 Nov 2023 07:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CB4B821C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f6sx5e9ZuTkm; Sat, 18 Nov 2023 07:15:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CA50821E0;
	Sat, 18 Nov 2023 07:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CA50821E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4ACDE1BF39D
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 07:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FC6D41EFA
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 07:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FC6D41EFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9tx0z4_6owss for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 07:15:39 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3810241EF1
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 07:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3810241EF1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C17BC0002
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 07:15:36 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 07:15:36 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231118071541.2FC6D41EFA@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1700291736; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vejZwkGhF2h5DtlZBQ/0upwLWEhgD/vQKkV+jSUYpSQ=;
 b=ml9pfOGEN1oLubnIEozyyn8phb5yRXbrmsWPOEDL6EDLNfmrnO0q+WvTkz74atK4d/p8dq
 fjLqmv6Q2vZSP8y9i1dyYpoJ34gw49XE7GtH/7QU6e9fzDmoeqqQznfFjcvLo+A20a0THQ
 Uw5zHpbQHqUFK8Hx1BcZEX/cqHw0WDsLyGV+vTxL+hB871JVWODl0cC4QCNBoP8uaLYmp3
 cGS2BTAdc3ISliwk/881tQ6mownw80bXiBmbv5Cpfa6vhycF3y+0KoI+9R8ELfIGfJq7i6
 j19UKfO9XkKSrDsA/Yf3hxZ/OA9Poky9RHjRNzEn1oKKU1X4wfYENu4TR/4CeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ml9pfOGE
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-17
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

Autobuild statistics for 2023-11-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  5  |  0  | 10  |
  2023.08.x  |  4  |  3  |  0  |  7  |
    master   |  8  | 12  |  1  | 21  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 2 
               apcupsd-3.14.14 | 1 
           dmraid-1.0.0.rc16-3 | 1 
         gobject-introspection | 1 
                host-go-1.21.4 | 1 
                  jack2-1.9.21 | 1 
              liquid-dsp-1.5.0 | 1 
               mariadb-10.11.4 | 1 
                  monit-5.33.0 | 1 
          python-msgpack-1.0.7 | 1 
             util-linux-2.39.2 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/824263ea706d6074dc61975e30c527463772ede4 |     
  powerpc    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/5a16a469faeeaca008190b443b002db10480e757 | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/f4ab876af76effed170a55f5c7e9519656911b61 |     
  mips64el   |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/ec3c8e7d43538c0dd72d81a8c431f0328d1a1acc |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/00ccca3ebc5c5368835cab79c13d704528bb9c18 |     
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ebaa9755ccd41bab0ca1ffa8d68ef4bbbb1cd2c5 | ORPH
    m68k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/69a011fa95355d0420b042ad58cc76ec66aca3bb | ORPH
    i686     |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/d33a3337df38284e63a598059275ee250a87cb92 |     
  sparc64    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/0ce5cc00f446379e9234a5196e164027b9c8f5ff | ORPH
    arc      |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/c92991cad7b0f79de971a78ba8dcbaa13d20cec6 |     
   mipsel    |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/cb986c31068a06bcb155112544a3e80578d1fd30 |     
  mips64el   |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/b47dee0374d2344fbca37cad54ef603447a18959 | ORPH
    mips     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/66117ca464455ea8a115f5d15f59fe9ada2d8a62 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

              host-rust-1.67.1 | 2 
                 fdk-aac-2.0.2 | 1 
  gobject-introspection-1.72.0 | 1 
                  linux-6.1.62 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/ab7caff12844bc110f8a64f09a6569ae040ddf38 |     
  powerpc    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a05202f60679ae5abba99a50652a610aa64dede4 | ORPH
  aarch64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/7c678a918e2d6ae823c4d90c73b4ccdb7ca3f23d |     
powerpc64le  |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/466b39a9dcdfe822f467867a9c43f0133db5b708 |     
    arc      |          linux-6.1.62          | NOK | http://autobuild.buildroot.net/results/1518d5ceb6b4f234cb0a90b15174324573e9e156 | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

              dropbear-2022.83 | 1 
glibc-2.37-45-gb4e23c75aea7... | 1 
                  linux-6.4.16 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/01b2ff5ad7fcfe554eb0c43da36661793a6b4a9e |     
    arc      | glibc-2.37-45-gb4e23c75aea7... | NOK | http://autobuild.buildroot.net/results/65b246c637ca2ec11adb564d9fc307cc635c432a |     
   mips64    |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/99e8a4b1dd28b0fe57c6ad2034539265e03388c5 | ORPH


Gitlab CI results for 2023-11-17
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551321568  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551321575  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551321705  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551321766  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551321770  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551321773  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551321785  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551321876  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551321877  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551321903  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551321908  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551322020  | ORPH 
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551322041  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551322048  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551322065  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551322067  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5551322077  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5561446066  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
