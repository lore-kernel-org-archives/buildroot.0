Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E54C71153
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 17:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69D3860EE2;
	Sat,  2 Sep 2023 17:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69D3860EE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UnzjgB-gEuWn; Sat,  2 Sep 2023 17:34:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B679460E8B;
	Sat,  2 Sep 2023 17:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B679460E8B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72F111BF407
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4ADEF4190B
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ADEF4190B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pGHtCVRYe6Ef for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 17:34:38 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E71E7417D1
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 17:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E71E7417D1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B16B1C0002;
 Sat,  2 Sep 2023 17:34:35 +0000 (UTC)
Date: Sat, 2 Sep 2023 19:34:34 +0200
To: nvd@nist.gov
Message-ID: <20230902193434.4865dbd4@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693676076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SBsYjyTYbNa4nTvefXloWDC10rzIy2cENE3ym55eUkA=;
 b=CUkj4TaWOQYqaCcSydJimTh4IPKt6IDy3lShslzIDkuX+1D7Z7SIln7t3+BKg2VMWH3BdK
 vdXPgjBAn45wC0p5d6fuylquBivRXbtzucFDE/Ar9bD6qE5VJNh6h8SI+V64fXUt/qyH+6
 xA6g4ZEKgeU8Q8+9aoZiKmPWXk5DueatIJFLR1TNR1EOPdaEjlzLs8DIFo6WvF5ytbMKmn
 LYkFoWyTs/9+k5G6rxBcyyN8nkDF+YAwHE7D47U6ZLoY2J9SmnDN60QPbnz39gMc5Xt5/7
 hc1jG/1AuT3r2bRxjqSEq8BeyM/g7jmHEZG4Xq8WtHspTYHyBUTYQmfAxh1mZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CUkj4TaW
Subject: [Buildroot] CVE-2021-4034 version range fix
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dear NVD maintainers,

CVE-2021-4034 is marked in the NVD database as affecting all versions
of the polkit project due to the following "Configuration 1":

  cpe:2.3:a:polkit_project:polkit:*:*:*:*:*:*:*:*

However, as indicated in
https://nvd.nist.gov/vuln/detail/CVE-2021-4034, this issue has been
fixed in the upstream polkit project as of commit
https://gitlab.freedesktop.org/polkit/polkit/-/commit/a2bf5c9c83b6ae46cbd5c779d3055bff81ded683.

In turn, this commit is integrated in polkit since version 121:

polkit$ git tag --contains a2bf5c9c83b6ae46cbd5c779d3055bff81ded683
121
122
123

So, the "Configuration 1" should be fixed to indicate that only
versions < 121 are affected. Could this be addressed in your NVD
database?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
