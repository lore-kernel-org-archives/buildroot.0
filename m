Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF12C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 22:35:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7438860EBA
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 22:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7438860EBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BF4542816;
	Fri, 27 Aug 2021 22:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w20WW_59W9E8; Fri, 27 Aug 2021 22:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 925D44289F;
	Fri, 27 Aug 2021 22:35:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 986501BF3D4
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 22:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 833D183F1C
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 22:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YgGJMHKqeshw for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 22:34:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02111.aruba.it (smtpcmd02111.aruba.it [62.149.158.111])
 by smtp1.osuosl.org (Postfix) with ESMTP id 814038355F
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 22:34:38 +0000 (UTC)
Received: from ubuntu.localdomain ([141.136.145.219])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JkQimYAQuqG1wJkQlmHeJO; Sat, 28 Aug 2021 00:34:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630103676; bh=cYpqNlM6mACdfqmp8Vp9E4MA4W6JsNAUaS6RYkfKhcU=;
 h=From:To:Subject:Date:MIME-Version;
 b=PogjYGW5GTbaj7uiRuhANpH2ADCmTnTIgxIx93mJFK+s/FuqHJtAuLPDOfEEZNXlC
 kr+8QcnKyx06w3Ntjgfx3k7q1u4ElbJhe/eDggtmMh1s9ze7EITpN5FbUQlSZfasje
 zVR0eeSGm5CyPVNBxomSQ2xS76HUUf/04IWcR9HNZ2X4zcvgRg/139TLAueWhhGBvj
 9X807hhtNc2MMV0Ol4C7qnMFIifekjZvDKGQKOaCFGhl73fASrMXo22nb3YCN4g+AT
 o4Xgsu5NK9aFXYNfdCqLRPoYW8vM2NEYyMX+J+gUen81X3LnIrlL2osF78QaAx+7cz
 0MjV+ceC43Oew==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 00:34:32 +0200
Message-Id: <20210827223432.1961888-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827223432.1961888-1-giulio.benetti@benettiengineering.com>
References: <20210827223432.1961888-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPXStjjn+zsACQdh6vnnmQZyyTN3ibits24qgcZTGQXP//7NOIw6ca/K4twWY2cAJq4CLCR/iawGmubfz0JpqaynVUCszR/zjmEpjGFK7b+WIASKg27v
 gE+u3c3EanZoYX4lKngRHbRGcoB5iKEA5vDN5NoQ9E9YEpIkdSTBPjTUjNb7IFQ+EZ/L9kktspsla6YTycwU7JR2krXB14m6q1BabGYiZTaJAx8uGuMqwatF
 DUurBbbt3rX1tz4Mwy8fe7sPO10v7V1iTaGuWh7TPhrS0ynz+sRouZvMc/D4pqHWmMy3Ryx1nGW7FxtB9aySjHkjBeii8xwXMJL7ihEUzzhxwOm6Kkr2kPHu
 eKlg3HLS4mkv6FjvyDuoAIr+UB5ugr2HHNO8BUALeYzT/xekSqt1AGVABGsJgBKLkulzbRYF
Subject: [Buildroot] [PATCH 2/2] package/ruby: fix build failure due to gcc
 bug 83143
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
