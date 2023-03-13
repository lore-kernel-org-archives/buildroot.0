Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1D0C61DA4
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 08:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DED1404F4;
	Mon, 13 Mar 2023 08:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DED1404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10KnwJhe31p2; Mon, 13 Mar 2023 08:17:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBFAD4018B;
	Mon, 13 Mar 2023 08:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBFAD4018B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9C941BF3E0
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 08:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A302A8133E
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 08:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A302A8133E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EHIiD7O7hkc for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 08:17:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6AFE81322
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6AFE81322
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 08:17:14 +0000 (UTC)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 1AA9188;
 Mon, 13 Mar 2023 09:17:12 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 09:15:47 +0100
Message-Id: <20230313081549.493823-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=walle.cc; s=mail2022082101; t=1678695432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=drt0x0FIUoGfik0L0iL4MLg7MRuiXDjFSQHophfNxyU=;
 b=M0fcQKEHSFk3aJtvVHE1zGrumptjficrrG7DjWQBsiXGvcVzK2TFKtIRWBF9A4qbPIrLOi
 TKIH8qE9SepT0L0jjp0lVDgdv2/u+R9IolZkc19/pDAhax2dnMQzZElj4E5ewVV14QYi/t
 rZpiJN+6TkEE9rLah1YhmcUXDvkywflWcus9tJx5G9GiZL3UmxHAz4Np/surwE4CTZio4L
 Zv1fJ0wlpJptLLh1xXI+uvwlzfZiQ+L9xEDYtWxVXUOvqjuAatW817x2wEGqkyurkpySB7
 5lLVYyO4St2y/LBOHt+regN+NvCC4zAM/ix4sJ8rU2myYQCExUFYrJ/JMzjM3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=walle.cc header.i=@walle.cc
 header.a=rsa-sha256 header.s=mail2022082101 header.b=M0fcQKEH
Subject: [Buildroot] [PATCH RESEND 0/2] new package buildroot-initscripts
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <michael@walle.cc>
Cc: Michael Walle <michael@walle.cc>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[resend because rejected by the ML mailserver]

I'd like to add a new initscript which saves the date and time on system
shutodwn. There is already an initscript to preserve a random seed during
reboots. Consolidate all custom buildroot initscripts into a new package
buildroot-initscripts.

For this, rename the old urandom-scripts to the new package
buildroot-initscripts first. Make an entry for the package rename in
Config.legacy. Then add the new init script hwclock to our new package.

Targeted for next, i.e. the 2023.05 release.

Michael Walle (2):
  package/urandom-scripts: move to new package busybox-initscripts
  package/buildroot-initscripts: add hwclock initscript

 Config.in.legacy                              | 11 +++++++++
 package/Config.in                             |  2 +-
 package/buildroot-initscripts/Config.in       | 23 +++++++++++++++++++
 package/buildroot-initscripts/S20hwclock      | 21 +++++++++++++++++
 .../S20seedrng                                |  0
 .../buildroot-initscripts.mk                  | 17 ++++++++++++++
 package/urandom-scripts/Config.in             |  7 ------
 package/urandom-scripts/urandom-scripts.mk    | 12 ----------
 8 files changed, 73 insertions(+), 20 deletions(-)
 create mode 100644 package/buildroot-initscripts/Config.in
 create mode 100644 package/buildroot-initscripts/S20hwclock
 rename package/{urandom-scripts => buildroot-initscripts}/S20seedrng (100%)
 create mode 100644 package/buildroot-initscripts/buildroot-initscripts.mk
 delete mode 100644 package/urandom-scripts/Config.in
 delete mode 100644 package/urandom-scripts/urandom-scripts.mk

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
