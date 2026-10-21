Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBEF606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 18:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KAxLVY2s;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ILFokAN+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D74F84EFAD;
	Wed, 21 Oct 2026 18:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5tu6GKzxWdAz; Wed, 21 Oct 2026 18:42:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1D7184EFC7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792608109;
	b=qKrLIpE5lWJ1xPwJYEyhMt77EblM5gCKXDkmLKdYYbXAm45b2ZWXtEg16itfWxMI51b+
	 RWycm25UPZZpmI2wYpE+SxY6VfVPf62L4FIDEEK6eTBpJ/JTLvuPUS1nRCriRQyme402q
	 loAK5nDHidwH4AjCMOd3mZqri4yPIOJI9n9lilVUonrIwRzhEYzQRvdfZmlRmOctFsxLU
	 S25VBvDYHe3zPwvDdyhy3zeRx8g9RMssPkkqJhTlVeaD1V4bQLce8mwSHHWRzEhPFl3/8
	 MBBoPhzHeDHHeCjFcujzpMFMyoEpQJZnGKrERYPrl3sWo68BD5RFKwYofcDsZclEgIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792608109;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5VKMpCuYBdEIMWATOs6+u34bHmOP8Gs3HvKSV2sqcl4=;
	b=oQYa80BU0S4cdWqIWbsnqf8fXbgkQ3JuwjTkrRX4b76h06gPz8J4VvrAvlI3hncBwPWh
	 OfKhV8vaBy7Sl4xkGxrdIXMvhwLYrkYLOn3mM1Rv8Ksho/J1eo1nfbuFGqtVvNgqrk0ik
	 zxA333o5csKInnWuNrjIH+TU9/sWTSBUnlKt8qweOh9iZ1pcSxlG607mOmZAXLuOCD7oc
	 H3wFgKVQHKH5/Un1A+GDvKJRmKhXgG0dzzifyPwE8BbZkfUhycu4V7rIAtDo570BSCLYS
	 kmO3wiyohiTy61JOxE31Ypo2rpmVvCunk74iTZQYP18V3tQXvqjF4lTVis+0OCnueDg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792608109;
	bh=5VKMpCuYBdEIMWATOs6+u34bHmOP8Gs3HvKSV2sqcl4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KAxLVY2s+Y2r4fmTb4QLNIGG+TXUH0pkF4THo41rU2DzvprT99L57C5N29IUXREat
	 EiMnvz6z2PjpktHfbudr5oRfoi1yxz/Ezp+7aidPYn6zXShC5hpCjdz8jNO9mhu7wU
	 iCJtjWYewzbqAtu12Jh1Ya81IVGMRPI0UCcj5ELeElA1eVM9t4UgmPSKL0BpyYeNDi
	 wU+u4YExbOr5flnU+8zFBhesvz/oVzyvH9Cj/YePuyUYWw3441ZEaBpm6GwklFv2bo
	 2Zzahrmzcw7vb5Bm1LVKBYpfS9TlBoLVx6pnZK5hY73bvnW3fsd0p88PRc12xhqW9v
	 JxLGjwIWti8TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D7184EFC7;
	Wed, 21 Oct 2026 18:41:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC29D95C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF9E7850DB
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0jtLHnQTTY5O for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 18:41:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D063384F5E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792608105;
 b=VHIXbFpfLmKoejlFQPITvIeyM/3gpW3pLWvyoxNeZj0XuZp4ajv5IPKjFJuAkyCsGiHx
 ulsksRPk9Fit1ILv1l3G4MNAp7PGzr39XLtw0G50yHEtfF2Z3tIvjKwLzHqTpxbA63XdD
 JTGYQi1pUE5W8eQFOC+AQnEzdNa6i5/RBLXbILY2U0cduJT3QQh+Ha2o74hY0dd5+M1MC
 8wdULftraNoiU+GOc63C2aBvg8YqzWhvcRqRoDkjYqx+udc4ZcGvjxjhDhV2PIdXXP8GK
 EV5+QumQhyhzuP6c4THJYIVUPmPgHdNGhUwZGjE81hY5z56QHKEQTHgjut9MNgC5m9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792608105;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=bSEPkvFEsmEhCAAa0khMn/7VO3RuC5W5bQO2hkn6F/I=;
 b=ON6ju8TvGRCh5WrXQ1jX2tHF/nAosrZEKrZRtV7yFYpW9vuR/IpRisLjF/xi7ycg0mhk
 3g66jYjb5w7VypbbAV7bnvb8yH44glqUYvGsUb2xQ/vmPbTYQ156+K9WPrfo/tLBYQq5f
 EOgNGLODJILjttccZdAVifWTumvBhO4tNqCvU8mNKjYEdGgIxekDJzyKUwELUqS36rPO5
 /e8QJgWytYBhpWLaCCSpN7Pd8Lnn7M/pKgoMLI/pN09H/S8arj5aWS1f6rT5vbd8Lf2HJ
 FR2+lWCILoaFxGr1F32X4RMW4Dt36jwqSkR7O6OgEwio6fC0oCfvf0pASFCTYolTtPw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ILFokAN+; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ILFokAN+
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D063384F5E
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792608099;
 bh=bSEPkvFEsmEhCAAa0khMn/7VO3RuC5W5bQO2hkn6F/I=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ILFokAN+a82FZt1KWI0r8gITsGQpXgmjCYZJDxfeNyQnWP5IzHz5QwmH+URPSoVyr
 C1DmwBxhMnCnkyUASeJM84qP/4AMG4maoLSpwSdsnG3iXVnF4ZnodQGIiCqR9HIYZQ
 jX0VKfg5rcibv6Plpyr66dg7D+5QvcE3JB4TdXsXjz+TD1u6QnCPhMi8s4jIRnGPtQ
 jmxWTiJAcjs0jYIx+1I94O8A8bM9VMOgJSFzJWxR8CqIT24jLX6pdhNT0+1PEqCF1s
 xTuJuUj7cjcdrJiulAryJtDM4/qe5Kt38lA4HxpZ8zqv+VXQASvKMIkHZ8Dsqv60y1
 O9vweONziVmEw==
X-KAS-Sym: v3:f51bdf72230551df:V7ipQ9HkfkQ/854DwVDvAgDWVhfkomLpXYySyH7LcgFKs
 pkW4v1vaHqCWlaGpihusj2SQk4EAcyAOv8CR1Kw+QeInnqWmUW0bmINeg2ze7HvKZdXn4mF0sGp
 QKUEtpgMdGt0YWbJfFjFfVkpSVkBJfB6NmQ1W1sWSNoTq9DYA9048wfmD288GZeBC7jgFkom/vX
 pqsllhwScrJg3243HkxGBX/8ANze4akT6wjvPRlnmtGVcHzqjVbNRUL75JSIdvgvrCrcFSwrkuE
 HS0PLOQ1gEbiZYiUfjgLTN9vL3fBxQ3dOAWO0kFAL9aM7rT8CNBiCMKmcHs7Rb2lECXaKLUw==:
 zCVcdXR5bp4XwKC7zXqpxBWNOAlOAJCAaGiQztdJpxLIvnr3ROkZrdFug/tWFzrjvwufHLfk1tz
 YOoXFJKb10OIUr716qL8d0zF9ombdK6yx3x+fX4BVCrlYqXbscwPwnfPITZVDmXs+evwBNVRCMw
 ZAEfScWgkyI8lE2PRRYweXz6R1ypuj173+aqpaHoGzkWYRpixwiO7FnhvNqySkqUScDrTEX8y9i
 blKd4nT3cV6m5zR1uDEGh+btfK5d8+bRweCSZAk/v6gTYIkV7L32OY9p27jQQz+SRimlNT7B0rH
 gZk+4jWq0L7cG6LC/jGyv+0/ZKXlK8BHBFZpoQC8lFB0Wg2a1OjRZfcJ8CBqp4/tToyzZVKkQc6
 jfi867+sIp9FGH6ttUD1FrEm6XcbWZLgCuZJBPiLs0bKsbQ5TxwqA+RqArcoR93et1cfE8M47Np
 LnDaOik0eowQ21pmrbGbAIiTgjmBTG1FCYBDUjGG613on8KfvXpIuywGNjzD0fVYPu+gk+t3ICS
 iVudHZBl7IKKyyMyF9i8er39MBwBdMBUeFESZLtJU/ES+neq6gjav73pUa0SMknCxjWfh1wM0Ub
 tC5Hmw==
Received: from fli4l.lan.fli4l (p54a1bacd.dip0.t-ipconnect.de [84.161.186.205])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AF374A4C5E65
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:41:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48174)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJbFr-0000000034c-1uFU
 for buildroot@buildroot.org; Wed, 21 Oct 2026 18:41:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 20:41:38 +0200
Message-ID: <20261021184139.1135207-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021184139.1135207-1-bernd@kuhls.net>
References: <20261021184139.1135207-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 2/3] package/xxhash: fix prefix in libxxhash.pc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PREFIX defaults to /usr/local according to
https://github.com/Cyan4973/xxHash/blob/v0.8.3/Makefile#L549

libxxhash.pc contains "prefix=/usr/local" without this patch causing a
build error with libplacebo when xxhash was built before libplacebo:

Run-time dependency libxxhash found: YES 0.8.3
Configuring config.h using configuration
Configuring config_internal.h using configuration

../output-1/build/libplacebo-v7.360.1/src/meson.build:247:6: ERROR:
 Include dir
 /home/thomas/autobuild/instance-0/output-1/host/i686-buildroot-linux-gnu/sysroot/usr/local/include
 does not exist.

Fixes:
https://autobuild.buildroot.net/results/344/344af8504a77ae96e4009d76a77572180cf49b14/

No changes were made in upstream libplacebo to src/meson.build since its
addition with commit 006aab8d64d2179d77df9a696b3fd8636f541640 so a
backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xxhash/xxhash.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 51bf6ce855..fc2084c878 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -31,7 +31,7 @@ endif
 
 define XXHASH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		MOREFLAGS=-DXXH_NO_INLINE_HINTS $(XXHASH_TARGETS)
+		PREFIX=/usr MOREFLAGS=-DXXH_NO_INLINE_HINTS $(XXHASH_TARGETS)
 endef
 
 define XXHASH_INSTALL_STAGING_CMDS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
