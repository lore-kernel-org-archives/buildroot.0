Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1EEC4338F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 23:42:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CFBA60EB5
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 23:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CFBA60EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A6C8401DC;
	Thu, 22 Jul 2021 23:42:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2lzSWWJvknXX; Thu, 22 Jul 2021 23:42:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDCBA4015E;
	Thu, 22 Jul 2021 23:42:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 522F91BF3A3
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 23:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E8B983143
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 23:42:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VJwsWgJE6gRY for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 23:42:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFFA182BC4
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 23:42:50 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.181.181])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 6iEDmGaT8qG1w6iEDmUXMi; Fri, 23 Jul 2021 01:35:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1626996946; bh=xK3QKjPbgYuYCZAen1kybjzH9qQx2QAE9QPhk9Rt41w=;
 h=From:To:Subject:Date:MIME-Version;
 b=HEhH5fzLjFskzwzSKzEpHHDAzAhH62j+37GAoRBQ4sQwYGF4//nBOq1TXMYH20cJb
 PY9uHkh0RNlOXQUDDHf30Yd6AY0PnNTiUhUZmm6wTAypF+aF2y0pMkk6Q9RtuNosfK
 HEyBxWhLh5O1kWpVoUxMdjO8dILEvPuY+JEp+Gt7DzVJ5he5UG1krrXI4xrslvuVyN
 31lGzdsZcVI7HGKP5a8kTHgZ5ATHzkkpg/elD+Gz+I/D1eKV9uNaxBefIKdMdEWiYW
 bHE2m6qHc67c7tCFf3/CnbSBt16ASa/uVWWzjIZ06dAgc2aZ3td9sI7WOOdNQRn8g4
 rNcM+pbYwyEcw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 23 Jul 2021 01:35:42 +0200
Message-Id: <20210722233544.1210678-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720224443.24edcd0f@windsurf>
References: <20210720224443.24edcd0f@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPAqxgo93NIXy1Pn7m/bQ4n2kSjTlCGMJXi3uqDjpKrFoTk244EDUqMYgh5viUuJlm1/8SLps25BzHt+uZRayuTgpKtnGM7U54OWSaFMoO+bFIux70bv
 DrbkngQC7QXVgHQ8Sv3neqnNowVgKFp3ib6fY6dl5nb9mD2cr/XeRYUsfop3pYTrHl2DA6RDNzzXEZps96nLVvAaqY+MhwjkVG4/kdruaLk6Q2e1br3FaaX+
 BcMFpuSjdHR73m1R5T01WoqxVZjW3Di9VCpy+zGD1OS/ozuYztmPWUV0XVe++oc8
Subject: [Buildroot] [PATCH 0/2] Bump NSS and NSPR
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This patchset bumps NSS and NSPR version. NSS 3.68 requires NSPR 4.32 so let's
both.

Giulio Benetti (2):
  package/libnspr: bump to version 4.32
  package/libnss: bump to version 3.68

 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 package/libnss/libnss.hash   | 4 ++--
 package/libnss/libnss.mk     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
