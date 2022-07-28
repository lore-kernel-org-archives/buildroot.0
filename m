Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D116C19F29
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 17:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA61483ED7;
	Thu, 28 Jul 2022 17:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA61483ED7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1MjKW-V-56JL; Thu, 28 Jul 2022 17:50:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD43583443;
	Thu, 28 Jul 2022 17:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD43583443
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E9291BF3C9
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 17:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2C1F401F9
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 17:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2C1F401F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y5C5jpbhyunn for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 17:50:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABEF0400CC
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABEF0400CC
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 17:50:47 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1oH7ek-0005zM-9m;
 Thu, 28 Jul 2022 18:50:43 +0100
From: John Keeping <john@metanate.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 18:50:36 +0100
Message-Id: <20220728175036.3262606-1-john@metanate.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=cy6SaBOABp16WXms8OOky28uCKXZv4fOtsGTvkM3VoE=; b=Pt
 rSDDbSZHcvGo5P18mhN6gbuG5DC84+8VthdkqjmpOY6P1ZaAwBU4GRuDi0ucu+4I5uBVW9n78oyu8
 RXHqwzuKUbHgoFAjvdE02SMFzKV5r1RkIc5EwyQTGvoQ3E3FI3sh6TD0yaXmeaG4HxGTSipKvZj/i
 K1smEdgB6gcTdRdY5EhYgV6xL9EuhEbDyrRGpzldxTddS0nw0qFWhTDkXL8Zfdbcak/BoJxc5VfSH
 +Uvj6JbvIasF3Er6k/+sp6Z+P49jYD25Hnfw1uVTLrSv5gYIcwm+HwcUNK2CB4B9Fsi+BwMbb4RCr
 ZvhslkTB1s1WJuZ63rAuYH/sccCR9Xng==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=PtrSDDbS
Subject: [Buildroot] [PATCH] package/connman: add an option to disable stats
 generation
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
Cc: John Keeping <john@metanate.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By default connman periodically saves network interface statistics into
an mmap'd round robin file.  These are not accessible over the D-Bus
interface and the only method to interact with this is ResetCounters()
which is marked as experimental.

Continually writing statistics will increase drive wear and may not be
desirable in some devices with limited flash erase cycles, so add an
option to disable this.  Statistics are enabled by default to avoid
changing the behaviour of existing configs.

Note that connman does not provide any runtime control over this
facility, it can only be disabled via the configure script.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/connman/Config.in  | 9 +++++++++
 package/connman/connman.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 72b76bf19d..f45851f94a 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -94,6 +94,15 @@ comment "ofono support needs a toolchain w/ headers >= 4.12"
 config BR2_PACKAGE_CONNMAN_DEBUG
 	bool "enable compiling with debugging information"
 
+config BR2_PACKAGE_CONNMAN_STATS
+	bool "enable statistics round robin file generation"
+	default y
+	help
+	  Enable generation of statistics in a round robin file.
+
+	  This is enabled by default upstream but is marked as
+	  experimental.
+
 config BR2_PACKAGE_CONNMAN_CLIENT
 	bool "enable command line client"
 	select BR2_PACKAGE_READLINE
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 1b6fd611f5..a76a339e6f 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -65,6 +65,12 @@ else
 CONNMAN_CONF_OPTS += --disable-ofono
 endif
 
+ifeq ($(BR2_PACKAGE_CONNMAN_STATS),y)
+CONNMAN_CONF_OPTS += --enable-stats
+else
+CONNMAN_CONF_OPTS += --disable-stats
+endif
+
 ifeq ($(BR2_PACKAGE_CONNMAN_WIFI),y)
 CONNMAN_CONF_OPTS += --enable-wifi
 else
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
