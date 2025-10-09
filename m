Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10723CCD187
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D293583E8B;
	Thu,  9 Oct 2025 14:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tt-c0-KWjBrR; Thu,  9 Oct 2025 14:32:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB4CA83E8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB4CA83E8E;
	Thu,  9 Oct 2025 14:32:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 66894119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5826041076
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQ1fBVu21MHh for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:32:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E02E8404D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E02E8404D5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E02E8404D5
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:32:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.1.172]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mplbx-1uU0eL1wSL-00Zn8Y; Thu, 09
 Oct 2025 16:32:40 +0200
To: buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:32:16 +0200
Message-ID: <20251009143216.2282077-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009143216.2282077-1-fiona.klute@gmx.de>
References: <20251009143216.2282077-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:lOWkM0qrOXMQgK814D8arHecdECNDR3Nls2tbzYiMpcOxnxqpCn
 Y1I7xTvtT14h2Q8cyTytzcvOVkE9R6urqDq4relWP2NHV7BFfbscvDAg8mFC4Veb23zTHcY
 /hLkz7cGP3431YdBtgoJc5ej2gzyS91UGvhILrPLAuJzSL+p8uAhQ0Erwzcdnf27m5hWVUa
 Uv6RbcrZGvXJ526ZiOeOQ==
UI-OutboundReport: notjunk:1;M01:P0:qr0OARRNvDM=;JuoWmrgs9KBRhuOTRREsCYk0AYv
 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
 eT8sw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1760020360; x=1760625160; i=fiona.klute@gmx.de;
 bh=95cHSfww5o6+UeN18XMMUFzorAgPlmjRggBzkG9QC+4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dokg5ZWhzpeuIesOaCrw3/AnZ+hWr90aQRLomDeHW6NPHfP66lnRozzZq3cW6Gqw
 skWHlQSl4nzIsJHTKaLZuYw9ub9GNxnLlEhnqgGmq48Skiha6ekEOpk4fS2s8q6oH
 24V9HVlmrOa8PFGlzchQ0IdMNQTV4xtFwBHmEodmkhomMjLldbxpugVq/rbePxtPy
 evNaK46bNNPcy1sLjsLduG3wyLHh9WdU+z6GW1UhRRtv8cTZvqJJahfogA7oXINVq
 RKbkCJ/Jx6tB+DC2RKaq5aCjFH5TZr/3H/6f1oUYeYrM+z9Hcf0YQskNd9AgFcLat
 cK4sFbf0OBiGuMhNPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=dokg5ZWh
Subject: [Buildroot] [PATCH 4/4] package/refpolicy: add config option for
 "enableaudit"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SELinux policies commonly contain "dontaudit" rules, which omit
certain denied actions from the audit logs to keep the log volume
manageable. When investigating issues this can become a problem in
itself because messages that could show the cause might be hidden.

The common advice is to use "semodule -DB" to temporarily disable the
dontaudit rules, but this is only possible with a modular policy,
while package/refpolicy builds a monolithic policy. Instead, the
Rules.monolithic makefile offers the "enableaudit" target, which
removes any dontaudit rules before compiling the policy.

This patch adds a config option to run the enableaudit target during
the configure stage, intended for debug builds.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/refpolicy/Config.in    | 13 +++++++++++++
 package/refpolicy/refpolicy.mk |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 7aea39b223..95b8c9dbea 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -121,6 +121,19 @@ config BR2_REFPOLICY_EXTRA_MODULES
 
 endif
 
+config BR2_REFPOLICY_ENABLEAUDIT
+	bool "remove dontaudit rules from policy (debugging only)"
+	default n
+	help
+	  Remove dontaudit rules from policy.conf before compiling the
+	  policy. This can be useful for debugging to see "denied"
+	  audit log messages that would otherwise be hidden, which
+	  show the cause of problems.
+
+	  Warning: This option will likely produce a high rate of
+	  audit log messages, and should be enabled only for
+	  debugging.
+
 endif
 
 comment "refpolicy needs a toolchain w/ threads, gcc >= 5, host gcc >= 5"
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index be27147ec5..127faf793a 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -101,6 +101,12 @@ define REFPOLICY_CONFIGURE_SYSTEMD
 endef
 endif
 
+ifeq ($(BR2_REFPOLICY_ENABLEAUDIT),y)
+define REFPOLICY_CONFIGURE_ENABLEAUDIT
+	$(REFPOLICY_MAKE) -C $(@D) enableaudit
+endef
+endif
+
 define REFPOLICY_CONFIGURE_CMDS
 	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = $(REFPOLICY_POLICY_VERSION)" \
 		$(@D)/build.conf
@@ -111,6 +117,7 @@ define REFPOLICY_CONFIGURE_CMDS
 		$(REFPOLICY_COPY_EXTRA_MODULES)
 	)
 	$(REFPOLICY_MAKE) -C $(@D) bare conf
+	$(REFPOLICY_CONFIGURE_ENABLEAUDIT)
 	$(REFPOLICY_CONFIGURE_MODULES)
 endef
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
