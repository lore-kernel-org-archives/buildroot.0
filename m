Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D86AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 21:38:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D419611C6
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 21:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D419611C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F9A460F57;
	Wed,  6 Oct 2021 21:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EmRUCwvIFIsy; Wed,  6 Oct 2021 21:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9328D60F56;
	Wed,  6 Oct 2021 21:38:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA02F1BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 21:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A636D606A5
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 21:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uIsr6iIue1BX for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 21:37:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01D1860F52
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 21:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633556250;
 bh=oECUiSFIj5uaKRVUo0QbuA3hNDyvSteehVE8MuI0+EM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=crCWfQtJ95/7IDz4zAHkFmBslX1B1Esdra2S6+hnuG6kltHbQT8kBtebz5eP+O/YW
 LxEgKj/SNQ6jrfNkmivX10zxeGaAyEksPCOLEllYxSFjJzVS8RlcWJvUM7w7rLv688
 i75jhg19+GIWgZ75EZNioeRehSWp0r5okVHdyabQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.251]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MvsIv-1moerN0CEp-00sxF9; Wed, 06 Oct 2021 23:37:30 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 23:37:26 +0200
Message-Id: <20211006213728.1069-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006213728.1069-1-ps.report@gmx.net>
References: <20211006213728.1069-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:8FKXIkwAI5qVRqv5d1I4XBI62hqYumWWKzFpQPOA61qy6TSHfnP
 H7u9A5anjO43mwICYFv84BoKThbQd+5yau+WO0OYt/adYdzJlVf+XvjvIAxQddss4LwWZfm
 cjUlF1po5zZxMyoZlUWOSYglTqPoXPHckFYj3DTD4WXPN5PfmexZ1CRYbwLUcEFGhp4aymH
 iGBil1ntgOAataLgbpuEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d2aRHW7NTew=:IirMbm0+OaAG3JaIrYvlkw
 5ngKzobBWmuspiFVxxCfbNcV3lHK2djYUpCw6jBO0R2x4BfB5VxvrQlcS0V62OSmYtT7Oq2nu
 D6IOVFSalLKkp4FYcyPbTugETmgIfrr0rcRkJndWWlSZ5blxz5qiVjWXhQCEGUd2umUSdrSGf
 hyPN737GlAYTrJW74xEPb00JuDX+z2I6QTOQTMbHA5Qh9YylUhKrdDWKKs6N5Se2DPUORQ9Zc
 zfDNs8a8ulbvfZSrJMSSg/puuz+T+JSZ2za1Mat+fZR4KONncJdvdAeb1MRYHMA6QER9i4a2M
 5jxVtAy7GAOwv9ChpNaroxQIFaLczdiHnhSGqZP3YAWlEfVeklb9RyAOyWamMVciw4d5yOY2X
 OPWPn4F9vC67zA8JSXO9PYaTb5lknT9Yxk4i32XIfcg7uTher2j5dQ7QsVsjI5yXmovoj0lnf
 D5XUwAkzF8D/cgti9OxQeQ6N9I6UBJZ5aAJVeBl3Cs6galV5lMYr11D+bQrY54hcwmDn4Sfkg
 amDEBv4bLcZXyWKJhMigtvtGky40fUgSYld4XHR10L5PNOKO8c4C2fAy+iApLaUkvbLtGQ/Du
 Pr+//hqe4rpDbgQASuTknCR36xYW85pbm0WQ1gXRXgHu85TP1UdTowxx/NRjC5FYrR1jxIW6K
 DBFSKIVjwcXv11E+mdGQZ33HhSse2oX57ykqnQJL0z402EYW0A0BI7W+xMiK9PMWRdM4+YBAX
 jO3k5qTIk89DHvNEaB4DbuEl7kVWkvlLb3CqKVB8NsUC7/aPvunQ6MiiwnuEZg05DxpK8B/zG
 KOytXgWpJNgMm5Kuld22Irv10kig0tXMSL/Swdu9RG4OlkDwCHIaY5/tchArY0gMroTGnnObC
 vkUU0xYbqmlf7CuZ1VdSQMfUAyRLzaShg/Rj9/FlN0EJTN3BTyrEPgLpto1mA8ZnTIU+u7R1L
 iTe4njZvL+G7PRir62kH32H+yTr3Tkv1q+G8vKOXVFYUgI7z+vp4ox6NBXnROP+7jRW7fMFVI
 cFXboKNIXpkhoti45Cb+a8kZR3YDW/WZxAu/lPAf59nddrtbBu9HVQxd1mzfMsU0EpKsenJZ4
 PKy8yQ1IMYeNpA=
Subject: [Buildroot] [PATCH v2 3/5] package/rpi-userland: bump version to
 6e8f786
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
Cc: Vincent Fazio <vfazio@xes-inc.com>,
 Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - new patch
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 4a0a8cb9d0..4927a8b43b 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d67def03931215f41b741aed5a3a1bc2bd62fa33f5cc14692e9a4d65f2e0ea27  rpi-userland-97bc8180ad682b004ea224d1db7b8e108eda4397.tar.gz
+sha256  e1ac871911e52b9fe07b3daa080b21bcdec3f1d2926cc98c934794780a4bf8d8  rpi-userland-6e8f786db223c2ab6eb9098a5cb0e5e1b25281cd.tar.gz
 sha256  bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5  LICENCE
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 4f249d7bb8..a670a4a02d 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 97bc8180ad682b004ea224d1db7b8e108eda4397
+RPI_USERLAND_VERSION = 6e8f786db223c2ab6eb9098a5cb0e5e1b25281cd
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
