Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61099C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 18:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F14188125B;
	Wed, 27 Jul 2022 18:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F14188125B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hfl76h28SdXw; Wed, 27 Jul 2022 18:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E09281CE1;
	Wed, 27 Jul 2022 18:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E09281CE1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E63A71BF422
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 18:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3E6F8199D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 18:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3E6F8199D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VEUUzqenxXR1 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 18:48:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9277A8125B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9277A8125B
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 18:48:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 466E860004;
 Wed, 27 Jul 2022 18:48:55 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Buildroot List <buildroot@buildroot.org>
Date: Wed, 27 Jul 2022 20:48:49 +0200
Message-Id: <20220727184850.2857314-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727184850.2857314-1-thomas.petazzoni@bootlin.com>
References: <20220727184850.2857314-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658947735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nA5sov0Hkwc9DVzue6vw3/X2C1QFVhEqATfpp5h0D1M=;
 b=EMwQY1sG+Ge3UKCiFrl4/vlb4+dFKVuUBFVuTlfmcMackQP0KT9RPzTKttLwsy7sWE2zCN
 OZgOjOLzymx8s5Z1H5Cr3+/E9MD3h5w0C7aVMwtN6D/Z9EANtpMz7/vADZ0IeWyRhh0hKx
 wPMYdQTcqzMwmuocEw2fR/y1ZhHw4dM5pvOxyNTZLnVqua4iEsJuhBFzk5l4Kprw20fy84
 +3fvpgSwRu1f5pRVEtCuui+Ka8M0YgtRU+00+vRpjSJF25Q1mg7jHW09aQR7YXugr0Wrmm
 wvqUVM7rR3jh+QSFGhcYbyvpYRPA1jZYxAbJM22crtkB9y2PNaE7UTzdNgKcIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EMwQY1sG
Subject: [Buildroot] [PATCH 2/3] docs/manual/ccache-support.txt: document
 the new BR2_USE_CCACHE variable
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/ccache-support.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
index ea64628615..ab4f10be23 100644
--- a/docs/manual/ccache-support.txt
+++ b/docs/manual/ccache-support.txt
@@ -55,3 +55,15 @@ first.
 See https://ccache.samba.org/manual.html#_compiling_in_different_directories[the
 ccache manual's section on "Compiling in different directories"] for
 more details about this rewriting of absolute paths.
+
+When +ccache+ is enabled in Buildroot using the +BR2_CCACHE=y+ option:
+
+* +ccache+ is used during the Buildroot build itself
+
+* +ccache+ is not used when building outside of Buildroot, for example
+  when directly calling the cross-compiler or using the SDK
+
+One can override this behavior using the +BR2_USE_CCACHE+ environment
+variable: when set to +1+, usage of ccache is enabled (default during
+the Buildroot build), when unset or set to a value different from +1+,
+usage of ccache is disabled.
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
