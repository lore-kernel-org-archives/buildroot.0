Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6E8C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 08:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF3EC40A04;
	Thu, 10 Mar 2022 08:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gLkZCtK1cwqQ; Thu, 10 Mar 2022 08:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EBE8409ED;
	Thu, 10 Mar 2022 08:10:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59C651BF38D
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 08:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A42983313
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 08:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id waLRgz_cyQVJ for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 08:09:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BCA28430C
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 08:09:43 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F421260002;
 Thu, 10 Mar 2022 08:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646899781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y4bR0j6ev7rFJXuHdox2tIY9BJSPo37n9MiZ6EmOs+U=;
 b=f9a71dsid88SCtWgdTksqKTPXcTeoucYNWVXqO8WMwS4LboqVlcw0+7EqQcdHviIx6ez2n
 m41cLAd1k2Ung0gyZnJwWB1fDr4ecy3GP+9q1+w9rpnUT/sjfF0jgTvS08+N0WgSalokkV
 suhzXpIWKV/kbuAhc1TvcXNeVg7I9c6ykYqg0SuT8RZsYf5keuGNUWG1HYVJ1UXFCnP7+R
 /wjTueQC5CGAGep0yY9J8VM+VP83rhE7ceu0tGM+M+FJinxEfRlLJWrb1b3BEwuN/g2cb0
 W/+1T8Qe2KSahdt9aYcGv0s1wmp2KHVh2Kj1WLyr/67XLVrodBn9t65RAPU5wg==
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 09:07:42 +0100
Message-Id: <20220310080745.16903-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] boot/optee-os: support new optee-os 3.16.0
 build dependencies
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
From: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TmV3ZXIgdmVyc2lvbnMgb2Ygb3B0ZWUtb3MgKD49IDMuMTYuMCkgdXNlcyBweXRob24tY3J5cHRv
Z3JhcGh5IGluc3RlYWQKb2YgcHl0aG9uLXB5Y3J5cHRvZG9tZXggdG8gYnVpbGQuIFRoaXMgc2Vy
aWVzIGFkZHMgc3VwcG9ydCB0byBidWlsZApob3N0LXB5dGhvbi1jcnlwdG9ncmFwaHkgYW5kIHVz
ZXMgaXQgaW4gb3B0ZWUtb3MgcGFja2FnZSB0byBidWlsZCB0aGUKMy4xNi4wIHZlcnNpb24uCgpD
bMOpbWVudCBMw6lnZXIgKDMpOgogIHBhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBoeTogZW5hYmxl
IGhvc3QgcGFja2FnZQogIGJvb3Qvb3B0ZWUtb3M6IGFkZCBzdXBwb3J0IHRvIGJ1aWxkIHdpdGgg
cHl0aG9uLWNyeXB0b2dyYXBoeQogIGJvb3Qvb3B0ZWUtb3M6IGJ1bXAgdG8gdmVyc2lvbiAzLjE2
LjAKCiBib290L29wdGVlLW9zL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDEzICsrKysrKysrKysrLS0KIGJvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MuaGFzaCAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDMgKy0tCiBib290L29wdGVlLW9zL29wdGVlLW9zLm1rICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICA3ICsrKysrKy0KIHBhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBo
eS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rIHwgIDcgKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKLS0gCjIuMzQuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
