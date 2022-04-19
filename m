Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA152C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 09:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 867F7612D2;
	Tue, 19 Apr 2022 09:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzRbq4sFuu_0; Tue, 19 Apr 2022 09:22:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A22A61147;
	Tue, 19 Apr 2022 09:22:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 213A01BF299
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 09:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E16261147
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 09:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w82ZKEqwGUXS for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 09:22:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F01B560C1F
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 09:22:04 +0000 (UTC)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 92D82E000C;
 Tue, 19 Apr 2022 09:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650360119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xrh9yRUxSuhXwRnWqoTpZA0lMxJXK5g97aEZta0y//U=;
 b=jBW9tKYWWOuRo+YkYzIThlCHjMhN+dQsOptvRoNcdzkrldBGn+ejaFpBimnSPHSkgtOgtp
 ahc9GpDaShhIawkAUfbGfHvPYAYRZS7IYMzwduBbj36uT1BPVDcVeB47Nl7qV1ODQ5TNqQ
 p/DCB3AP1/w1zUxOwzm1mUzEzfKy/NClN66NbBIg8nbmFCMD6wEtco4pKF+wx9o9m3+5SF
 cdCvasWQnPHZdfNbxoclg7nawydSU8JIlVtSrV/1UhgX3hweExBIXZU03uPM6/iCycBipH
 5Yv3Pa89as0GpHU5lfvV+RWYx6+vz7HAqRF8uHAvZZbUk/Qoyn/uij89csk57A==
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 11:21:49 +0200
Message-Id: <20220419092151.91638-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] Support for i.MX Code Signing Tools
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
From: Thomas Perrot via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: Thomas Perrot <thomas.perrot@bootlin.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This path serie add the i.MX CST package that allows to sign bootloader
stages, to be able to boot them on i.MX targets that verify the digital
signatures through HABv4 and AHAB.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>

Thomas Perrot (2):
  package/byacc: add new package
  package/imx-cst: add new package

 DEVELOPERS                     |  4 ++++
 package/Config.in.host         |  1 +
 package/byacc/Config.in.host   | 10 ++++++++
 package/byacc/byacc.hash       |  3 +++
 package/byacc/byacc.mk         | 15 ++++++++++++
 package/imx-cst/Config.in.host |  8 +++++++
 package/imx-cst/imx-cst.hash   |  3 +++
 package/imx-cst/imx-cst.mk     | 42 ++++++++++++++++++++++++++++++++++
 8 files changed, 86 insertions(+)
 create mode 100644 package/byacc/Config.in.host
 create mode 100644 package/byacc/byacc.hash
 create mode 100644 package/byacc/byacc.mk
 create mode 100644 package/imx-cst/Config.in.host
 create mode 100644 package/imx-cst/imx-cst.hash
 create mode 100644 package/imx-cst/imx-cst.mk

--
2.35.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
