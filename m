Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC55C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 10:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 977FB82021;
	Thu,  8 Dec 2022 10:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 977FB82021
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TlhbEjLh4vdT; Thu,  8 Dec 2022 10:03:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03C4A82010;
	Thu,  8 Dec 2022 10:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03C4A82010
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CEFB1BF3ED
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 10:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD51A402E7
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 10:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD51A402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9InwmzBfOKF for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 10:02:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C5FF401CC
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C5FF401CC
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 10:02:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C56E43200495
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 05:02:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 08 Dec 2022 05:02:52 -0500
X-ME-Sender: <xms:S7aRY8ReweNstINf3bEm32EnFaMd_-m-HNgSDY1E0OuPSFbPuarFkA>
 <xme:S7aRY5yNH1E-DJAKatJt9mkMzuMv5eaJHibkNUOQRSATYMzgrX-p84WQnHS4Wbsfl
 XiIDbtRwdESMEpv>
X-ME-Received: <xmr:S7aRY53L2a6MNLX-G5Pin0R_PjqFjRPY5GX-Uj1bQjDxImNk6CJTtV8W-HLgROD0HMDuN0XbuB1e5Bjw52IsIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtgdduudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukffogggtgfesthejredtre
 dtvdenucfhrhhomhepffgrnhhilhhouceurghrghgvnhcuoehmrghilhesuggsrhhgnhdr
 tghhqeenucggtffrrghtthgvrhhnpeekffetffevjeelvdevhefhleevgfffveejuefhhe
 ehkeefffefhfetkeeftdejfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrihhlsegusg
 hrghhnrdgthh
X-ME-Proxy: <xmx:TLaRYwAsSj-HmFliVrIBBLF83zKuvznD2XcAAXRbVhZBPn6bzNhNBQ>
 <xmx:TLaRY1iAYGLml-CzMVElY8bUXYHgCTIfzYF-7P858L7s6v3doJU55A>
 <xmx:TLaRY8pRbLhAhCNy4kykIHPq0rZFlmgtx6Tiu9eJi1Z6QWgeV2hXDQ>
 <xmx:TLaRYwtebXDedom4i-nWVjDgf5JuR59ehVlniS6w_fID8qc5jWqArw>
Feedback-ID: i1d444086:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <buildroot@buildroot.org>; Thu, 8 Dec 2022 05:02:51 -0500 (EST)
Date: Thu, 8 Dec 2022 11:02:47 +0100
From: Danilo Bargen <mail@dbrgn.ch>
To: buildroot@buildroot.org
Message-ID: <20221208110247.7002c3ca@c3po>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dbrgn.ch; h=cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1670493772; x=1670580172; bh=/zNqU2B86N
 WrpkReMI5V+aQ9kx16CwWAuqjcMp9lPSI=; b=QVHEN3lfAThOwlYU9K+6oqasa0
 uwKXz0H9GaxjUoTFaEZ7vtggp6E1+zQZi+jeJ9AfsXtlX8fNS5jI58pEzIkk5Pkf
 iRKZ1wPCimz089eNUai6pPT6nMcAKWbs6ntR2NRRzpGN3bw2YX4M3b8anqDsTA1z
 fZ7wtCH7Bkuiw0HmJ0dUBHNW7zYwVXqS0FHnUs4ZC8m6scVaJF9OvV3DroBcR/HO
 YYQPNdl9pQ3SMTG0QeE5x/EZ9E34pFx7lS0u9W/9JpZV2rwwjlhVlsprWvaOVGYE
 YKWPOMXRtW4d1TELnTaMRixuvY9qICcIU4cxvIg/K0wRIhw1sS26YMmSJoJQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:feedback-id:feedback-id:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670493772; x=1670580172; bh=/zNqU2B86NWrpkReMI5V+aQ9kx16
 CwWAuqjcMp9lPSI=; b=satlE1x+zn9xei9Xycvjvj3SLwGz2QawrR0dnOszHJCj
 qMUGIM2UkW7p8qQPUrvFg/4wCeYiXLBnr03PZo7CIr5CO1aw7K0YP9oM7CYpqtNz
 tzPj9sXAg8iJQQE8vCj2+HQtawCg3mqZUkDg64Ll6Tl0FbWcH96KzXJKOsgwwHp2
 DF2p3OT/IDFktCWtYpz2t0JBH1NFsX3CB5F2uKrzsv+f+a9GYlYadCcjlpT7KZ5D
 5lwEvyA81I5+SpYkjIzKF6NJwAgFxgfyIQZRIAIZOAYvZ980JaecYoxamG1ELw/1
 GoQEDbxXqoUDhOgUWEgO7Iy146tocpTQL2fxZrG5LQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=dbrgn.ch header.i=@dbrgn.ch
 header.a=rsa-sha256 header.s=fm3 header.b=QVHEN3lf; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=satlE1x+
Subject: [Buildroot] [PATCH 1/1] package/tealdeer: exclude unsupported
 targets
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Not all target architectures are supported by the "ring" dependency.

Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
---
 package/tealdeer/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/tealdeer/Config.in b/package/tealdeer/Config.in
index 96ed81614b..a61a59f3ee 100644
--- a/package/tealdeer/Config.in
+++ b/package/tealdeer/Config.in
@@ -1,6 +1,14 @@
 config BR2_PACKAGE_TEALDEER
 	bool "tealdeer"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+    # Crypto dependency (ring) not available for mips:
https://github.com/briansmith/ring/issues/562
+    depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
+    # Crypto dependency (ring) not available for PowerPC:
https://github.com/briansmith/ring/issues/389
+    depends on !(BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le)
+    # Crypto dependency (ring) not available for Sparc:
https://github.com/briansmith/ring/issues/1512
+    depends on !(BR2_sparc || BR2_sparc64)
+    # Crypto dependency (ring) not available for s390x:
https://github.com/briansmith/ring/commit/4d2e1a8fb80398f7c3c0137ea8fdd512f82d37a0
+    depends on !BR2_s390x
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  A fast and full-featured tldr client. tldr pages are
--
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
