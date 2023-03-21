Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D6DC6FD20
	for <buildroot@archiver.kernel.org>; Tue, 21 Mar 2023 20:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 645766120F;
	Tue, 21 Mar 2023 20:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 645766120F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBXhNVpmxxme; Tue, 21 Mar 2023 20:12:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3F5D611F5;
	Tue, 21 Mar 2023 20:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3F5D611F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9C611BF357
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 20:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3D65416B5
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 20:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3D65416B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABzF5p4H7atC for <buildroot@lists.busybox.net>;
 Tue, 21 Mar 2023 20:12:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39DE5415DF
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39DE5415DF
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 20:12:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.121]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MAfYm-1plL6c0rHs-00B6US; Tue, 21 Mar 2023 21:12:30 +0100
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 21:11:32 +0100
Message-Id: <20230321201133.236692-3-dalang@gmx.at>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321201133.236692-1-dalang@gmx.at>
References: <20230321201133.236692-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:VW06dtTRShlJlEuwaT+GWY/H9DsKIDucStS30YYyL1xOPiz+fOU
 UON+MwT/fh6Wh4K6uAcHWJFTSJbjaY5UMjZSHtCxXhU1ohEF1jZ/ZqJQyfB3sKX9U6+0aBS
 ab3IUIxj2MbJm8os6Opb1JBrO/EZkvnf6A9IeiD0PkRKslfBtpI5eaMkKebKzvvI/w7F9f7
 mkiP2ql9E5yUCpaZ+DI7Q==
UI-OutboundReport: notjunk:1;M01:P0:GSc8F0Hvc6Q=;fIqwnUKjL0Znw8qVikZfoX6yXpK
 jHkD7h5ua+ja3kETHHTdc32sJg7OJu+U/Pbz185lMQvFo/3jTD5ADMuk1Pg5swL3yXngyP9oi
 fKlOsqIp/rlY0CpC8eIEQ+5xweKYAX28Uy250iG19D0oe5cAggragEQ2LIElu6D0Q/MVJWYoE
 5csoigPZXCMfUATYmPlM2CKtvNEETuM9FVEO5yfqdxYrfPo4NYI1S6XqW7SFRp7/0JuYMJGl5
 esONCicoa2p8jooUCi4xIBh8nh0xP3wl9ZC7n2aMPqZTCMr0RGhVLjCav9Wof0tvUqMZDJw3z
 Pjd2Q/XxnLEsuKvG4oZrIACGdxDj2oXc515Xex5wQPblR+AkjW/eiypZMP2oFD2Pkjdx/aXPH
 /Brt0s8UhtnVwH4JDfXbgtPr3LTi/u8iI/xdQ/jGZgn0jCAdEg1EFetxgYMkPnzSL5S6r/LYO
 PriccMGHwIZ4xLzXZ2FG3rA8kIBHndoXini/lwSdgogHayfezQkUv10EpKE9Y8Gl2d3JX92fC
 9yHTJdt0ldiFTk6azcuHQMkBOijZ9W3Jr3uPVT3VWuaDmkSVS3rZ1kkLaAQGF54Ejkhr9Qk7q
 vOF78nxeCq+cQO8Sbtu38K8kBXWWU6X7KxtHCwo464XgsA3XIosbJ1HlQU4pyp3qKTi42mGYG
 byKExsmM8gq0MSjxPYMi8H4OsCDucOFi9hpure9Y8sWARgq0Ey7epPebjiZkB/BAZ5E+11O2j
 2IbSisj7V08kQJCm0N1ZRIFIoWCOocHUkqVKqoopMq8kF+eV7LBFNeSmHAi4X4r/haZZ2MsuO
 jUFfKAwfVNl5lKzr2vc9EX/JJgoxDg+GQXxxq1EhT3b4+IEy1UsLgSusu4oSeY1EdPlT+/TJt
 p+BlywItNJ7wwohuHlKJY5k/2ErLkFGuBbLoUoQp+44LQsuux/iYMdndgTFv3iEnstNPBUTe4
 +WdSvQuoUYqM1WDWdxlwL3k2S8Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1679429550; i=dalang@gmx.at;
 bh=UD3UqbEJqU+cmwJdKW2CtKBtBxce/Mqn66TXt0N+has=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=RhIZVsSIhb+LycgNqFKnqWAbOcVMty6U85z3TDCyzii4blG57T7QgHsEFfB8xO9c/
 U11VmV3/8Kq9fb0UiQ7jUOTDVeYd3moBGiRX4dIBChM2+4158kYn0wjBd1do0LtbpH
 aosGFCvmkC2LreGYCP0v1XVEnOHvCh0fMHZc3zrtjz3SnoDcisdArJXhGhDJZRyZHa
 ZTPu11mjQ9CtgxqitYq9FP8tuDNobKNwm0FykE+R6lB0zWNzMLSRQcvtgJvqzGtbSJ
 oTKxDh/93Ta0DadFzvGdnQkSGuvrfgFioVKOUUPqRKTc42T7DCft+w/iypSfnGPC4L
 OVy1ykfQP6j4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=RhIZVsSI
Subject: [Buildroot] [PATCH 3/3] package/cairomm: bump to version 1.16.2
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
Cc: Daniel Lang <d.lang@abatec.at>, James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/cairomm/cairomm.hash | 6 +++---
 package/cairomm/cairomm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cairomm/cairomm.hash b/package/cairomm/cairomm.hash
index dc32453220..254413af09 100644
--- a/package/cairomm/cairomm.hash
+++ b/package/cairomm/cairomm.hash
@@ -1,6 +1,6 @@
-# From https://www.cairographics.org/releases/cairomm-1.16.1.tar.xz.sha1
-sha1  a2de9b7fbfe8176cb555d94bb531ba1a07f31cc4  cairomm-1.16.1.tar.xz
+# From https://www.cairographics.org/releases/cairomm-1.16.2.tar.xz.sha1
+sha1  c24339d5962e2bcbbea85b2fc66347e71fd3db8c  cairomm-1.16.2.tar.xz
 
 # Locally computed
-sha256  6f6060d8e98dd4b8acfee2295fddbdd38cf487c07c26aad8d1a83bb9bff4a2c6  cairomm-1.16.1.tar.xz
+sha256  6a63bf98a97dda2b0f55e34d1b5f3fb909ef8b70f9b8d382cb1ff3978e7dc13f  cairomm-1.16.2.tar.xz
 sha256  bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
diff --git a/package/cairomm/cairomm.mk b/package/cairomm/cairomm.mk
index 6bb29ea051..571512878e 100644
--- a/package/cairomm/cairomm.mk
+++ b/package/cairomm/cairomm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAIROMM_VERSION = 1.16.1
+CAIROMM_VERSION = 1.16.2
 CAIROMM_LICENSE = LGPL-2.0+
 CAIROMM_LICENSE_FILES = COPYING
 CAIROMM_SOURCE = cairomm-$(CAIROMM_VERSION).tar.xz
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
