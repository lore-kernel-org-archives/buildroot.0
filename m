Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA43C432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 17:45:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 506076101B
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 17:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 506076101B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22CC240231;
	Tue, 31 Aug 2021 17:45:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EK8Lt89cbJfe; Tue, 31 Aug 2021 17:45:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 918294029E;
	Tue, 31 Aug 2021 17:45:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 30B511BF9AD
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 17:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F55B6062C
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 17:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQYtg7OUr_hc for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 17:45:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0766.aruba.it (smtpcmd0766.aruba.it [62.149.156.66])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A0BD6059A
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 17:45:07 +0000 (UTC)
Received: from ubuntu.localdomain ([89.164.10.189])
 by Aruba Outgoing Smtp  with ESMTPSA
 id L7hwmvjpIIyy0L7i0mHsWJ; Tue, 31 Aug 2021 19:38:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630431485; bh=cYpqNlM6mACdfqmp8Vp9E4MA4W6JsNAUaS6RYkfKhcU=;
 h=From:To:Subject:Date:MIME-Version;
 b=T2ahypnQ3FItzztiCd+5lgUsgJAzQW7uWBApgSn7XGnCBmDiRhlgXuMSHWYQ21dO0
 mgHwNvw01TP/2W9Pe1mhz1UCFO/SYK1EiUESla72S55fTtwwFg7ZUYe7PSwZdIoD2H
 JQ7CtPKIeBuFoBTtlhJRtJlbYuWzkrhcpkeqLbM6CQaAUXGfkdLbiwV5GkdA0azBG0
 +JhpyZh6+kLQZoTs7Hb4qA3SyeFjFHAIfcR2oyWTHrAn+pVzKeM5ii1wQAsn0Xc3FH
 h//K78tyaeGcWWy3Egk6XZzRg0/r5HPNKwOXd3ZzymjsFS7KNJu+be/7OC4dzXrt6x
 E5Ws8Mmd8PgfA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 31 Aug 2021 19:38:00 +0200
Message-Id: <20210831173800.22088-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831173800.22088-1-giulio.benetti@benettiengineering.com>
References: <20210830235951.24b82f6d@windsurf>
 <20210831173800.22088-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfONwfSDEbaztiCa+OLvYp5bqdyVwEak/votx11jMtdxeoS8OGCYZl3/dGYgB5oPTSY3+ojUe79dciP/kVkVZ2jDMxHs3PVnE46v1qJckh90EbdOOGYMu
 qXtAHYC22X63NJLxr4VGtpSkLBAyVjv9ikbEelYSjkhx0hnScVA8xMq//tkmErcqHF94LRz84O+USjgxelgTfMf/BdGdKZmpXNVCTY9cT2yrXH3AJfdL1BSD
 qm6uWvWpH7x5zQ4oh9QMmwCKDHKIn3NlsNBhbZVVKTtMjIiKFjumGmZeI23+TKcgcyOKQC1NT2gdL5AHQuyXxaXfTUKBjmYwDdh/zBNakXGW7zSm/5xvKee/
 NRbkwMwUzqB4UoUA6/AWA/EeBP903jdhGuCYVMHaYxy6R9ISrLye5gN8xh7xPr9DzvQ/XgXxXz0zTWeLWRfRtbtD2qjezQ==
Subject: [Buildroot] [PATCH v2 2/2] package/ruby: fix build failure due to
 gcc bug 83143
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The ruby package exhibits gcc bug 83143 when built for the SH4 architecture
with optimization enabled, which causes a build failure.

Differentely from other packages in Buildroot where we work around this
gcc bug by setting optimization to -O0 we can use -freorder-blocks-algorithm=simple
as suggested here [1] if BR2_TOOLCHAIN_HAS_GCC_BUG_83143=y.

Fixes:
http://autobuild.buildroot.net/results/f57/f5742e7fb6e8142bcdb53b7f4f5e9c1bea3558cd/

[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83143#c15

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/ruby/ruby.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 2434ce946b..b02744f0e5 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -77,6 +77,14 @@ else
 RUBY_CONF_OPTS += --without-gmp
 endif
 
+RUBY_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_83143),y)
+RUBY_CFLAGS += -freorder-blocks-algorithm=simple
+endif
+
+RUBY_CONF_OPTS += CFLAGS="$(RUBY_CFLAGS)"
+
 # Remove rubygems and friends, as they need extensions that aren't
 # built and a target compiler.
 RUBY_EXTENSIONS_REMOVE = rake* rdoc* rubygems*
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
