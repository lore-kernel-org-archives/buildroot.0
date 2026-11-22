Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921FE606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=b9kwdhMG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=WZIrR8nB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F1B080D13;
	Sun, 22 Nov 2026 22:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_9gZOYLRqyr; Sun, 22 Nov 2026 22:12:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A0D9F80C6F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795385566;
	b=hdabreEEl0SCLyk58tnRnvmUHelyMHCv4Kslt65m1E0pBIKudACfrJhlT3KhUC8et66Q
	 WFaA95RHsAvkg6Fr5R3Z0c0EIX4neB7v6DRmI2alLwHnuVuliKLIchJPX17CQI5EC7jlh
	 3kgo3H4y2325kcgDwgAr/VsSDQAZB2b8GBuUC4WEcB51OJ4705eGSrXkW30uJQ7wrKtX1
	 DzyT4vmJZx7ws4zyPIhk5btmHsmwZJsgQiN1u/6n9toBJPxSsbVfOZ7WQyk+CdPEhbZUX
	 JehulG/5RrQsqQ87i0cwaNRegKgkpc3CAru9zoP7DBR6rCGzRkDS/RlC0c9POZ3+19w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795385566;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ei5I94guROE+CnOTeBAVlVV9fK/nnZL0D2RnRfnAyfM=;
	b=riQ7mjvuEgluvsCtq9ifigkTguEt+x8u5sCrpEZdtILJ64xtuPZqXpdLH5GwirvDl3a/
	 LzyaMK2sb8m68mYJoUcbEpKRSJ5J9HujrQt6T7Ap75ED0cLMASpS92lwCDXRscIKbVI6y
	 RvtpDDBUg7zCqSAyHLYcKbulqrHqkwUfDn2kDKMpYzaC9dAmQuwywoKLD5jRthdNE49KD
	 VrWB6dYfDfe4Mnr49Bknt+E/AaAQuqAfjxVWVJ6gRw9EZl9evB6BL5DcTjPmpktHHUUYn
	 q/HH/Yh7JzXQCGTom+Cbz/9DHhVToGGpXWM+WYYalD0IczZRSaFAS9KEmr/rUkO3q1g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=WZIrR8nB;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795385566;
	bh=ei5I94guROE+CnOTeBAVlVV9fK/nnZL0D2RnRfnAyfM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=b9kwdhMGn9uAFPIw4csM65sHhV/sRXciAvWCgUIFF0bJizeZgBbLjFsrNT57ttsvf
	 pDFs8tDbgYX19XkIeWU/13oYxHOZQQ/AbLzspru6ZqoURRV7SFspwytZQfdS+B+6Bf
	 1V0FrhV82xsi7C4LcLTY3GpcpZig1vi+fRdvjtZt7wE2f3Uo0iCGpkZ6rpUZotGh1i
	 y2cVj/yD+M4L4CNGIcP4dSoIwM6592lMwBvzBxE7KjNTHvcvFKk9nc31QFz+QgYlGA
	 Z8rZHQN/jzmuehP38+mpXkWWL8u97AG0zcvRtoaLT4FizNhCaigpBvPdgnArspQO6u
	 /f27/0XRcBHEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0D9F80C6F;
	Sun, 22 Nov 2026 22:12:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C75B310
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2264680C1C
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AreWs19hPBd9 for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:12:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 70CDA80C6F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=WZIrR8nB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70CDA80C6F
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385463;
 bh=QWjWEKN13OUh/ijJDdGya3tPTh05MhyrUoOF75UMaNc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=WZIrR8nBSs+MpGN9oKt02schbJJcNh5KBVY4hs7NbCkEbVjRe0l3Xhe5cRUoX0Xnz
 IBoqeSrZgDjHtY4DIOnWiP2Fd+v0ZR7aToBnjHV6RZ0CstSe+6en2itmrURZblmqIl
 rao2jYXHCqEK6zt0xnppEjRi62ZLFDBvkcRHedomFvyeg37ohuVrytlL5lHzAgQrfZ
 UJRpp+h/m3XRRZhupNcViW5NGhmwHquqdxVeCp9xIzP8ltq3urwtChvb+0//YP2qwl
 9sul4I7RweDI8MoMH10ztKvh1r0oLqoAZ/BF5HSbh/HelwENaDgTvV4CEqg7+oXbRD
 lNGOzo0DT0Qhg==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 Ch0O4X7sJugeloKwwBT5bs0pmT2/b2aLbgLc7Yf2m3lQxcM5KSf4K34SjkKBHnMFCi4At4T3VY9
 m9mxGVuHDDLaTdx0MMPfDKIG6GbxxRfh/0J4onlrMEOvMb48ZkzjyFD0x4qPz/KxvnSiJg3Zs2R
 ckHpAc8kaJ4wXwR5eqngUHspNttZZIJqD8L41V0hde+QlJsx//9tzcvOjCt0GRWgdH4wcUiAKLu
 pGnoc7jjiNY97bpiC3wEG0YmjMPqPd6P88NhuPbzFc2tIBT7PI9iBlf2U//Cyn7o7oyprXbSmaO
 uyY2YfhBdDsTFWQYoYAV0hoal05LGNfyS6Vi72kL28DEUieqr3wqXaXsKXqdLMDS+x7+OAOskCG
 6JDxP39dqy9iA0kYXicPq9QPVxo2vHwfUiRYoQoINNo1VjNYAwQnepYSVaRpC1zuJZ0FdZc/ooa
 xxNa6HI6rJ9L6HJqAPueudbH0notQ3blKcPSZcCzTNUpvzAYsu5ewhj2U0gH7jz0EvM0nnsLUO4
 75jzMlyGAgyZFCDwSVnJ4IsL2c0digO9qfKOYEA2Dv6bLKOjn9S3ofS2I0zjjnwi5SE9OK3zVz2
 hPw132CiJPNxIEMLyG9kHTOeFGdx9bUXHtbxkf4=
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9FFE1A4C4E8A;
 Sun, 22 Nov 2026 23:11:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlJ-0000000014Y-3OLa;
 Sun, 22 Nov 2026 22:10:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:10:05 +0100
Message-ID: <20261122221014.3945599-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122221014.3945599-1-bernd@kuhls.net>
References: <20261122221014.3945599-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 12/20] package/boost: test needs exception
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
index 10e1f9f811..8e1436a21d 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -336,6 +336,7 @@ config BR2_PACKAGE_BOOST_SYSTEM
 config BR2_PACKAGE_BOOST_TEST
 	bool "boost-test"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	select BR2_PACKAGE_BOOST_TIMER
 	help
 	  Support for simple program testing, full unit testing, and for
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
