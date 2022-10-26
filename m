Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998C0C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 13:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F5E18109A;
	Wed, 26 Oct 2022 13:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F5E18109A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EVP6EG4kwnvA; Wed, 26 Oct 2022 13:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C64B780DCC;
	Wed, 26 Oct 2022 13:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C64B780DCC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41E641BF5B4
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DC7F80C5E
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DC7F80C5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ksD_vKaTFfu for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 13:26:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19EA380DCC
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19EA380DCC
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 13:26:43 +0000 (UTC)
Received: from localhost.localdomain ([146.241.83.94])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ngQVojcL4uz2mngQcoqmA9; Wed, 26 Oct 2022 15:26:42 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 15:26:33 +0200
Message-Id: <20221026132634.999254-7-giulio.benetti@benettiengineering.com>
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
 t=1666790802; bh=4VtgK/XfzqOteUOAcuz11/0+wzF4eAbj8H5uJmdoYpQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=dgPVQe2sLVPmiR5wcyHKn6L4JfTAX8Vqx9qA1qDXpszxF+YmJDWYEVonEKQ1sUiNW
 ScU9NbY2i7JGs6+XGk1dnuUpf41C8NeCzU17Jzdype0q5yIcBg72EUUn6rAS7u7k6U
 UeJRIQbTqwnZWEFaRhrS1GdWz/moqZPItXfdLk1YFfUH4p26ahCKPmgQ+oaUjzRrGK
 ebZi3VptW+1wcD36Mlr0zb12AEsTKg/Y2ziS4K47KiuzeeOVSo3S+O7oNsZHER6tnf
 EdUpwkX8gtixFxWAimWk6TSydJKQbAfLZGiHSdqxEa6G2oCcb4xBdJgadifcVomj+e
 v+nVHe4u8hGAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=dgPVQe2s
Subject: [Buildroot] [PATCH 6/7] package/rtl8821au: disable package for
 s390x architecture
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
 package/rtl8821au/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8821au/Config.in b/package/rtl8821au/Config.in
index 87c191b22a..3d7bbf643d 100644
--- a/package/rtl8821au/Config.in
+++ b/package/rtl8821au/Config.in
@@ -1,8 +1,10 @@
 comment "rtl8821au needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_RTL8821AU
 	bool "rtl8821au"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  rtl8821au wifi driver
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
