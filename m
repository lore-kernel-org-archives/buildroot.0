Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE7ECCD187
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 22:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7211581FD6;
	Fri, 10 Oct 2025 22:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQvk4wSq9PQw; Fri, 10 Oct 2025 22:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F27D6821BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F27D6821BA;
	Fri, 10 Oct 2025 22:21:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C35299
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 22:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1728E60726
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 22:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-5Mts7f63da for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 22:21:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 91322606F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91322606F4
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91322606F4
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 22:21:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.114.253]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3il-1uf8I32PXP-00UJBK; Sat, 11
 Oct 2025 00:21:48 +0200
To: buildroot@buildroot.org
Cc: Antoine Tenart <atenart@kernel.org>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 11 Oct 2025 00:21:21 +0200
Message-ID: <20251010222122.1911651-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Dkb/gyi/1lTFwSHkK+5Do0VIpgqonCUpqAUAV3HFx9qHyEGhmdZ
 /7GFbgju3pC94WdouY4xDYAh7E5xwLlaVk5gn1RaI5D4SFV/uUGAMV61nvcGlcuQlYCUFrP
 hQDxJN9Si+x96MLi4JdMskUTEzJX2UDeMxCnf0P60HEnh+MN/+XUiv60LWr+AYBFQGn9IYz
 Mld+ghklOZDjSwhA91E+Q==
UI-OutboundReport: notjunk:1;M01:P0:QAIT2/6DDPw=;B3UCJbD7ImuT0gJ98rnvt1iZBBj
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1760134908; x=1760739708; i=fiona.klute@gmx.de;
 bh=Ixi1n62yNpfStKxPdhL9iHGb1tlITkj2DZgg0ZVB1Nk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=UPrM44cbPoSniK8KqCRM0nVSnMzqn9GpvHlA5WHuzoQ7ZBYzvoHmV6KbOrQ0082J
 WRghVHCAij2zg3iOaNd4nWHhxJnLfnQ0Wcjq+selT6WkWRzIi3PRW3nFaTVbWJ9m2
 /EPdwnQ6Gz3Z5i+iznAJ7XTwrlDxbnmH0BRLgdRze+jA3VfwAsYSmil8huqfZYW5F
 ovdAeOn4QdHmtAZYsd2noFwq7T1AgpwGBFDmACc2FedR8nScUMEi22BzVjwGlUGQh
 cpW9pVru50OSpvgLtkV/7vVhk8DFVH2MBAnEIxHq9LVeWSHelghDQIQVDMHTJcRaM
 0UtqmSwEdmuvxLPzdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=UPrM44cb
Subject: [Buildroot] [PATCH 1/2] package/refpolicy: add option to set policy
 booleans
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Policy booleans allow adjusting certain policy rules at runtime
(including whether changing policy booleans is allowed). The new
option allows setting their defaults at build time.

A monolithic policy (like built by package/refpolicy) does not support
persistent changes to policy booleans, so changing the defaults is
required to make changes across boots. Adjusting policy/booleans.conf
after "make conf" is intended for that purpose [1, 2].

[1] https://github.com/SELinuxProject/refpolicy/pull/355#issuecomment-792758725
[2] https://github.com/SELinuxProject/refpolicy/blob/4d97523c71603b12e92cf1b80cd0e01ac75bc067/README#L186-L191

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/refpolicy/Config.in    | 13 +++++++++++++
 package/refpolicy/refpolicy.mk | 10 ++++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 242d7f34e0..f330c685ab 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -121,6 +121,19 @@ config BR2_REFPOLICY_EXTRA_MODULES
 
 endif
 
+config BR2_REFPOLICY_SET_BOOLEANS
+	string "Set policy booleans"
+	help
+	  Set default values for policy booleans before compiling the
+	  policy (see policy/booleans.conf in the refpolicy
+	  README). The value of this option is a space separated list
+	  of either plain names (to set that boolean to true), or
+	  "name=(true|false)" pairs (to set the given value).
+
+	  Boolean values can still be changed at runtime if the policy
+	  permits, but such changes cannot be persisted with a
+	  monolithic policy.
+
 config BR2_REFPOLICY_ENABLEAUDIT
 	bool "remove dontaudit rules from policy (debugging only)"
 	help
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 127faf793a..2b8a7c7e24 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -107,6 +107,15 @@ define REFPOLICY_CONFIGURE_ENABLEAUDIT
 endef
 endif
 
+# Override defaults for policy booleans. name=(true|false) will result
+# in the given value, just a name implies "true".
+define REFPOLICY_CONFIGURE_BOOLEANS
+	$(foreach b,$(call qstrip,$(BR2_REFPOLICY_SET_BOOLEANS)),
+		$(let name value rest,$(subst =, ,$(b)) true,
+			$(SED) "/^$(name) =/c\\$(name) = $(value)" $(@D)/policy/booleans.conf
+	))
+endef
+
 define REFPOLICY_CONFIGURE_CMDS
 	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = $(REFPOLICY_POLICY_VERSION)" \
 		$(@D)/build.conf
@@ -119,6 +128,7 @@ define REFPOLICY_CONFIGURE_CMDS
 	$(REFPOLICY_MAKE) -C $(@D) bare conf
 	$(REFPOLICY_CONFIGURE_ENABLEAUDIT)
 	$(REFPOLICY_CONFIGURE_MODULES)
+	$(REFPOLICY_CONFIGURE_BOOLEANS)
 endef
 
 define REFPOLICY_BUILD_CMDS
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
