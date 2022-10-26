Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F83C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 13:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 154CB40543;
	Wed, 26 Oct 2022 13:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 154CB40543
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5VnpT-KeIPyI; Wed, 26 Oct 2022 13:27:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E62D4052E;
	Wed, 26 Oct 2022 13:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E62D4052E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36F0D1BF982
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1238A80C93
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1238A80C93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r_2gCL9PRlhm for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 13:26:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D7A580C5E
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D7A580C5E
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 13:26:42 +0000 (UTC)
Received: from localhost.localdomain ([146.241.83.94])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ngQVojcL4uz2mngQboqm9D; Wed, 26 Oct 2022 15:26:42 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 15:26:32 +0200
Message-Id: <20221026132634.999254-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
References: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfN8WKEpSYUIL7A/C+K0/33szVt7tBIgBJqN/t6mjaC1GtZsd50c+Eyxys9J+QMYgYuW1l+i2sMUEHUt3VKod6MhCXcXKbvYfjcjjTNqbSsAwZWZKsqig
 aCN8uI8Aulkq3JU1utJ1l3HJdYBZnkoMRWoQtZkSfrIgZB8fN3Uda/1dKaoSpyikmElXwEsdw9VEVn8Tb0kJ1tNC0Mc8vVCnKgZ+XMVxVnzExIMow1bn5ew0
 wObo8jrTXfVmwECjjC2qbSWNeigBxe4azBcJ2QiWp6Ba/iGkR1vF+3mM2fMFe988TmYfYihWXBVDIBd+a1Am+O+kYVneYPzktXrfOnfk7KnJeFz2oYKkRFlC
 XYvqGhxPegcC6MDtetOaCAS0y1ibpS8BfiS7f3BYKpgrSSb8ql6zwZpvcHhN4vHFalW151Dc47iPepZVFEt75+pnTQ+Q/frxBHLCrarvp8objl++K2I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666790802; bh=CDfup49tbm2bRnaqNqaYs4xMa82rSDKzxRgb/0FoxS8=;
 h=From:To:Subject:Date:MIME-Version;
 b=UnRnC1uIjTs/xFuggYU44aC7o5dOUckkESCiuCsaZM4rAB33nstjPGzzMbeSgFjlS
 sB8Fws438QJD0YRSjtfwroWf+86MSgCwa3Iz71MHMnsAdyVQbRY3J5OVOUr+mBeRXM
 fU+kyJIof6g3iGL06q7wjMD0T6Qm0W14ZQ3S0v3GWTQ3aYvUHctf7PnfoBMZUPYQ5t
 I6aHDjABrlrA8YEo8Oxh7ZzpxoWQOaCgTOGwr8/uDxjuFe3HcM5xdF33qCcJLhe7qY
 hcDRRGrxsRpIu4+5D4vH5r6bRVTZ/lxH38l5xGV1qxQGU+Fwm0a2dAbvO5rYnZnFBK
 0iFTmWIUu+JVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UnRnC1uI
Subject: [Buildroot] [PATCH 5/7] package/rtl8812au-aircrack-ng: disable
 package for s390x architecture
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8812au-aircrack-ng/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8812au-aircrack-ng/Config.in b/package/rtl8812au-aircrack-ng/Config.in
index 70cbd15221..d903ab2b3f 100644
--- a/package/rtl8812au-aircrack-ng/Config.in
+++ b/package/rtl8812au-aircrack-ng/Config.in
@@ -1,8 +1,10 @@
 comment "rtl8812au-aircrack-ng needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_RTL8812AU_AIRCRACK_NG
 	bool "rtl8812au-aircrack-ng"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  rtl8812au wifi driver (aircrack-ng repository)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
