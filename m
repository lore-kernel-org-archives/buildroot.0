Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8C5C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 07:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3291260F72;
	Wed,  9 Mar 2022 07:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HV2vhbz_yujC; Wed,  9 Mar 2022 07:43:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3866B60D4E;
	Wed,  9 Mar 2022 07:43:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B162B1BF364
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 07:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF1FB4089C
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 07:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LJYpbmpHNQeb for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 07:43:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFAB540358
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 07:43:33 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D99E11BF211
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 07:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646811810; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ccI558qSIOzegcgGBqd48gbIS3i/A8FFilkHNz05aZg=;
 b=mzIQT1nbDyU/jK2i9SVS5Exo/+X1u/QTU+EycfzSb6lGRt0xGSuXgB2o92uZQfqcbB7khi
 y4m8dhijgA1u9EXqYQHEd+eiMc9LP1bv7E8PlvikZNemKVmOV1JemuXIURMegsOWLb8yfR
 RNDN++qeJxto+cMztJlic3hYeBKCwGhaNgsXoTzGdqPxgvXbM3BwyOlAQ3lNQJKv3JxkMq
 23SdXHx0wPggFPIFIe2bevRqIvvesLPfLm44ySinLYqNY8fPljhGxNKph5xWo7I+SLpTAL
 jW/X6XqXMNlU2IntONx+vqdaLqQODCqw0YoOvtjYdPKFpYF+P5+aHQMwDHismg==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 09 Mar 2022 07:43:30 -0000
Message-Id: <20220309074335.AF1FB4089C@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-03-08
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

Autobuild statistics for 2022-03-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 16  |  4  |  0  | 20  |
  2021.11.x  |  4  |  0  |  0  |  4  |
    master   | 34  | 12  |  0  | 46  |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.63 | 1 
                  dnsmasq-2.86 | 1 
                    efl-1.26.1 | 1 
                     file-5.41 | 1 
                       frr-8.1 | 1 
                   gstd-0.13.0 | 1 
           host-libselinux-3.3 | 1 
librtlsdr-ed0317e6a58c09887... | 1 
                safeclib-3.7.1 | 1 
               target-finalize | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/32ba5bde054ceee823af0a27e2cb849031c226cb |     
   x86_64    |          dnsmasq-2.86          | NOK | http://autobuild.buildroot.net/results/99b419ddb5a3be561d39e715833510a59519213e |     
  powerpc    |           efl-1.26.1           | NOK | http://autobuild.buildroot.net/results/0a462c2de955d145a43aae657adf1ecc5ffba4f9 |     
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/2c8f26162e5c0e8202b58930930c08cf529bdb0f | ORPH
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/43fd833d5d6562b54988641cf8ad37e327d4fc8c |     
    arm      |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/cd485ea788be73a3dc52aa89f6c8993928f9734c | ORPH
   xtensa    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/08c6207fd5f86e4cf786408d36bdda2797b60dd9 |     
   x86_64    | librtlsdr-ed0317e6a58c09887... | NOK | http://autobuild.buildroot.net/results/ba76e152edad04134708f3d00ce78a194a18327c |     
  sparc64    |         safeclib-3.7.1         | NOK | http://autobuild.buildroot.net/results/024103bf9b624f25026cc9c9f60cdc3087379410 |     
    arc      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/b7092e72d59aa1b55b494f7718cab3e8287d117e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5b00e08bd10723985eb666d87544ea2ee6ff980a |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/f7f8969613ee6f2710cbf3d02fed1c3f22b7b029 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 1 
                  ndisc6-1.0.4 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/fc67af8a06c3a6d583be2a4211439d9fc3556846 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3d6e0a40b64ddf37429cf2b6870e0002a9d53810 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b5bd8c5dc46eb98a7958fc88e02bb9ae122fb6a6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/78b0bd1d3f5eab2c2b41d156c42b7da11e178424 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
