Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C85606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FQYQbUjK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=dGSjaSqW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF88A80D09;
	Sun, 22 Nov 2026 22:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRL0cNRcb2xJ; Sun, 22 Nov 2026 22:11:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 141EA80D0B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385480;
	b=Ew2T3T7o7LG3WF5LuJ20jYjiogvoRvk+oQYBdHSFHtl8uG5cw4vlmOLyqXWI1/gYko+W
	 iQYOlDEEYGEOIJZTkmtAGDqQNWcV01aDX5YfoZi4+mENXQdfyRtxIonQrNb2mJkb34LRj
	 qBvllXFAiBmXo3qG+AgI8DC/HVTkiGs6URnBx88MJpV15hvm9gx1VqMq6Uf53udjr4+7O
	 PemI6tvyNRBRcFt1bDwYpj3wbGhd1eEPTAygFwvR7vjn7h6xoCwNIHLfa37MdLwkmGhKX
	 w5XdYKOekVWx1f+ixEEaBHkqktzDXA59POKcUX2gipvo4t4CBJk70ZhTM30ulU6EpfQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385480;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nd/ZQcGwMTZl/PBfIPzXtbKeN7UemdDDFgMztKKJ2pY=;
	b=RFsivQ7iLiTB4EQQKiptkn8B8HIWhCubK0mDtMBddZcMFjXHNs2rmQtThLlqhZJ8wim0
	 Z//aRj5dF9LUvmMxbswefb9CoSXJVQWOvVSUx8ZFu+EnBSqO9N9dRH9CE7fJcC/x7b9y/
	 e2DOEHmRVkuO+5VYfDmvkXWlZwrTVFiTR1k2nlqqNg4KnEi/zy3AkIaCcFirjq4jLZaoS
	 +R1lr6gu1MDA9MreI7PwWpDL23YU7RYipbvyvXre3ol+bJr2gdFXPEUlkI+HeRHhwwk13
	 bhfB7uLP8RqB11m2UwPmmDIHuHnA/5BHWaslZBA8PDiLda9eKLbcXquJ8zlrwiZ4NLg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385480;
	bh=nd/ZQcGwMTZl/PBfIPzXtbKeN7UemdDDFgMztKKJ2pY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FQYQbUjKdMdxT+yXMbylhWzKvrVxTHTogOHryFO+KGdKeF3LX9yt2Nw71OAs7Wjlb
	 z+XVRjYHLElMn2y07iy6vZot7Ou7DQe53jNs2MrEVogui2rw3tzTPH0Beq+KRUECn4
	 lDediWDu/8YQ9AEmYQ6JUHzMOPguYT6x4LN0r/3Tjd9wXcAtJIDr2Movl6J6qaphtt
	 4+4bZK3lT8NYQMLj7M0cRTxK3eCiT0h3oUCusDgWVxLPj3qHjMEeyS6KtG2h7lRkEs
	 uRy0FFJZ65Z+lS84bCYomZ2a6+BHUCY55Xxkebl1gG1S7gl54M9IwyLOMkbpG3zPnC
	 qjg7v0XbpthFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 141EA80D0B;
	Sun, 22 Nov 2026 22:11:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EC2222B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 147FA405E6
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kn09h52IzY64 for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:11:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6849C405ED
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=dGSjaSqW
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6849C405ED
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385462;
 bh=K0UEkUO5h851KC9nmSTp8817pp/gGmCMkxmYXt3NWrQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dGSjaSqWKD67VyNNFfoEHaoO541uYLXVKoFl6s7UzJi01xdZ5A+9lU9rsk4sOWpoM
 tLdmFPxyl7LOzkrXcYcBAHuyLeagNK35l653Au5Xzs+j6ECHGjb6kUWh5bVcEAHeX7
 dsHKvzS9++XBkTFCtVfxDl/6MAdnRa9ukrqcMTQX6hxaFtcQwdKiFnIYEX0bW9pTFU
 sQxy4eVAMs6dGwrj9WJEKRidZWfnQgYciKBaLQW1w1C4jX3dhaNTfCC9eFf0QU4GcF
 Vu0k7YP84pt5a9BzjMhZDe8Q/63wFrq9i/ipFMmroJFHTAuA71oEt6eeKAcJzbP188
 StBTRfnPR0Y0A==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 PdNtzHOhy+55dUKMuQEWc2fxiu3KgKye8uYbl1xoNsZVYxQuTYPLoMEyxmGKwdINMc5io1GnvlN
 E68+ThArG43BtwtPT4Wn4sI4VAHuQzVQUTSomDNCbxqNQfSUYb6pQDQl9kA8GP9YUHBXJOwjeS0
 v56ziryfqoOGvGqSmuQ/4UiAF0scThpCq5j3qDYzpqDOm04+gvAhEjbdNU1qyheDMDB2jQuo8yl
 lNxyuIT9Xg2SbVORnwZ6aM/jZNCqcEs9KQsaqcYgVlJzvKeAF3lrrV/hwEU1I3tqRjrDT5Zngha
 JBIcIIBvmHFMqrglFgBkHhBvl9zaq/n5YQl/s/E2qdWxwogljpKxzPirKrDplLPLHImRdhmygOm
 B7tURrSyTjmVlydNgsbqGl3F1W0fAd3QCIKK9CJ4bWDSL8zJH7CEIfHQhsKaE6n/VCFa5PGeNrz
 L+6x0AzBf/09hh+wqqDhhbN9o/LY1Tck/3PXYX6RdA4a/FXLBg45vHWju7b2+tFpgFpaDmD4uIE
 iV0Z81LQUJIE7+NJ3fYR1RymVR3dsjKcX/gcGL+mbbniQC3U5gytVj3TG1KRQw6j4CLukbYixXM
 NBvT8aNVR464CWdcrMs/gdHQoPY4zE0baasVTKuP4Z7Oumg=
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 471BEA4C4E60;
 Sun, 22 Nov 2026 23:11:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlJ-0000000014Y-26Ge;
 Sun, 22 Nov 2026 22:10:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:10:00 +0100
Message-ID: <20261122221014.3945599-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 07/20] package/boost: fix coroutine dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michael Nosthoff <buildroot@heine.tech>

As of Boost 1.83.0 which is currently in Buildroot, there is no
visible impact if this dependency is missing, but as we're about to
bump to 1.92.0 this missed dependency would be causing
problems. Therefore we do not recommend backporting this to previous
LTS/stable releases.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index d98dbad5aa..92e5d51464 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -82,6 +82,7 @@ config BR2_PACKAGE_BOOST_COROUTINE
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context, boost-thread
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_CONTEXT
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  deprecated coroutine library, the non-deprecated coroutine2
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
