Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA11C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 08:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E20B580D5E;
	Mon, 25 Apr 2022 08:16:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2MwYdhlGDjW; Mon, 25 Apr 2022 08:16:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF83880C2C;
	Mon, 25 Apr 2022 08:16:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59A1A1BF3D7
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 08:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48C0680C2C
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 08:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrgmci6EeT3k for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 08:16:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from hr2.samba.org (hr2.samba.org [IPv6:2a01:4f8:192:486::2:0])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7852680BF3
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 08:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=aFvQKManYHAbs6LSimrbU5vUnJ+oLWP6jIqNoILp/SU=; b=EIWjmdBe3idP17jPgQoVje8+i3
 P5CH7sLSwRkpxGodAaeZrWdxjNLICfy9cx6k+oFyFvLk/YtfJLeMSA86YZ84IGZJea3Kjn51pwTU0
 cZpnuNYFrV6RIqVEEzD9NtRWUyJi1Gx8kJh4AURqeMWIc8KkV3NqMGb13I/jp9gxevqlUc0xSuBWN
 iWJE75b7C4gt7sXl7F22HZr9uK+dHt663ZDY9rCpfIN2IYE0gUNtG0lDdWGCG7544mnGAR9POCpb8
 rbMAUBdHDuMW3HyjXLwy6AY9P2zYYXX+ztBbx0R7JU/X25aIrH0xT7JMD7OYiNVrYM9zR7yOGlsdj
 Wq2h1ZS35vWAjN6BDr8KXgr1QrjISAtK3KGv/CfnJtReOWzDKrM0aRgIvbmU+d4cWBtLfhOX8vwW7
 L4locO4cFnTzSwH2dyuMyvsO+5KlcX45RUldCd/q7m2b/KtQ+ZZ3jwv3BgxWs+iF9LBD2Q4dHVWlC
 nLw247LMW1C0MW54bnNLG0ol;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nittT-002CzX-SJ; Mon, 25 Apr 2022 08:16:27 +0000
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 10:16:26 +0200
Message-Id: <20220425081626.80691-2-ambi@samba.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425081626.80691-1-ambi@samba.org>
References: <afc126a1-3afc-44e8-710c-69e9be5dd1ed@mind.be>
 <20220425081626.80691-1-ambi@samba.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/openjdk: enable for host
 architecture aarch64
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
From: Christian Ambach via buildroot <buildroot@buildroot.org>
Reply-To: ambi@samba.org
Cc: Tudor Holton <buildroot@tudorholton.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Ambach <ambi@samba.org>

Signed-off-by: Christian Ambach <ambi@samba.org>
---
 package/openjdk/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 8b7fd4653e..8fbe51a27f 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	bool
 	default y if BR2_HOSTARCH = "x86_64"
+	default y if BR2_HOSTARCH = "aarch64"
 
 # Taken from make/autoconf/platform.m4
 config BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
