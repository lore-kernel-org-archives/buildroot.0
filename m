Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED65606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 12:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oJJdyM8y
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01A7B607BE;
	Tue, 20 Oct 2026 12:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aPBcxkZVUjnG; Tue, 20 Oct 2026 12:07:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F1B73607DB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792498033;
	b=crvUTgP42foXNcrCFYPQrMi4sFRhdNwt0zIT93hvl9A5PVOUiC10fd1Pr2YOXXhN0KFf
	 XoKl5Z3ZwLi6ZFlOyG0dygiVxo0lhfU3njAngUM3l/0fRgqNdrLmuMXyNOxesPppWy1xJ
	 ltikd+GESDpQpBM3bvY9UB6f2lxQt9rb7EamxnKGmDgihZ/j1SzRb8ojKDrwWibEdHM3u
	 SCfmw1Q5k36EZT5Loz47/NpgLigZpoepE2/gYBY6eHHVfJAbCyLKabykILjxwttltF5ge
	 cThKak/699B8JyYAPXBbkD+mTV4S0V2LwKTnkY+nX6Cp+Tkg3Pet65RqRzBKFLzZWbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792498033;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pHU5K/gOZ2+ysNhQ++zjPd7wgRuTzuMDxxxMb5gghf8=;
	b=nq0jGrH811lxKMEIahmhVbvDf1ROGKIE5WI68bZkgDAx0Te15FCoWq0XotZuy6sQmyTs
	 6ljsYuir3i2ceiQPfpBbKmlTvjOPj9VID703GBpy/LB+lvj7z5MV2v9iZ7kWE879CiG6B
	 F0H9S3HcRTMeCcfwXnuLHJgUwJ0TTJEHfHGUZfM29XJHzmtPu44xRr46K6QQ6FPkInwj4
	 yFm4eJdH8AVUEvAXsflH49v3CD2G/Fpouv3c0Ux6TYsuUY0z2Bc11PTjqcZ+jUxFJwbtv
	 SOXsX1Dr6JbxWuxDwYzpxn47gRerFapN0JB5kPJYgqqaNTmi2wzlSJHVpSB/t6UiuIA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792498033;
	bh=pHU5K/gOZ2+ysNhQ++zjPd7wgRuTzuMDxxxMb5gghf8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oJJdyM8y67AMNBDy6XkJhQYlxZRksIwzY2P/huft4riiswA0dPNq4TsjaGH+ZzNQS
	 6Otc22IjITUSYjaJp+W4AIy87qOtcjdvWM5epELjK67mpyoeuUv2q+5DlV+mt9y34K
	 rvsunh2EMSVnn7ArzKdI/vqk1ut5RuDhclSd62Ib2xc1F6P1hz3EXA61nzno/drTPz
	 eGJHNjhFbwhxjraY823yo9HmmOcDZKMeql2MnPPpoZJdL5T+RoA7CcMjm/WOE5auhA
	 JkZexH5blAubiVb+/A5Wjip/bFCqHYhzCholmIl+2mI7oBxYoa4w31JRZ9BDtyE29r
	 SHd6gc5pN96Yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1B73607DB;
	Tue, 20 Oct 2026 12:07:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 440A13A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 12:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A1B4407C4
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 12:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9s3tubGHcAxx for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 12:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D0D7940790
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792498030;
 b=f+FzTFqh64hgwc2XYBz+KoQO0Vxsm3ysnjytTp9RazHaAMry92A7rjSxrhTtCDhctDtF
 CxDF3KoafOIHJd27Y96yQDVVNAFSgoVbnWda+389mKCemTs/dDShqX0V2bVlDa3dkKGwR
 6Z6SWhGW+3V/QfNc4tbvQVtFrfPGr2qSE0oC3585FAMFB0PS8og4gVL8wBjIBOmHpXL98
 5rCZicts/Gcdl7ilz/2sc5ixKvblePUuEJdq3ykd7Bx3ez49Isjc8l5LNBJ+bn2ixfqPV
 btLiSQ5uJ6rKRi2MDLWJ0EYX1juNVifm8jYEFqZmJ1CTKuRGIN3gw3b2u8X0UBydKTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792498030;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=MUxzB8m2d98kyl5es0hxTdkErzKa361NDd0eGrDgDVk=;
 b=emt2a4Ee+BLoEx2M3X+JWj4ZWwD+zRByPPOuSJ4EN7B4hYCqM2m+G0yArinE86BgVg+i
 qScf0STNjDH1Bgtkul76eRXk+kPCLMkyUZvKiiF9fcZgSUSJBBTTq50Bm5SRcOAX/chIP
 d1ErvPHfx/kkYMqc1KvuKxKov9XZnXg1HhEntUanBZk3uArHhbvccBmy69nv31CR++mFd
 2O3BOQ4fBO0/odpuNgl8WUWFkMEBbOofDz6UdW3zQRiGYsZOJYDK8vinbRqKaa5tqUNeD
 xsBsgsqqHib6oBjJU7XttS+oaUAQDDQFooiF4ZHYWV9sya8wOibDQuFaq+U6uGAVKqg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ggjekIDl; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0D7940790
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 12:07:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2E4A44E41290
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 12:07:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EF9E860393;
 Tue, 20 Oct 2026 12:07:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8742110328D55; 
 Tue, 20 Oct 2026 14:07:00 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 20 Oct 2026 14:06:45 +0200
Message-ID: <20261020120646.1306735-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020120646.1306735-1-thomas.petazzoni@bootlin.com>
References: <20261020120646.1306735-1-thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] package/pkg-hare: move cache directory
 outside of $(HOME)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

By default, hare will store its cache directory in $(HOME)/.cache,
which is a problem as we don't want a Buildroot build to write outside
of its output directory (to the exception of DL_DIR, of course). The
build of hare-package packages currently fails with:

Error creating /home/br-user/.cache/hare: Permission denied
make[2]: *** [Makefile:15: dbus-introspector] Error 255
Error creating make[2]: *** Waiting for unfinished jobs....
/home/br-user/.cache/hare: Permission denied
make[2]: *** [Makefile:19: dbus-scanner] Error 255

due to this issue.

We fix this by passing XDG_CACHE_HOME when building hare-package
packages.

Fixes: 44d38432343e65ec7a6d898cf982985cc2bc1e88 ("package/pkg-hare.mk: new infrastructure")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-hare.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/pkg-hare.mk b/package/pkg-hare.mk
index 15dc769311..6494d2651c 100644
--- a/package/pkg-hare.mk
+++ b/package/pkg-hare.mk
@@ -51,7 +51,11 @@ define $(2)_BUILD_CMDS
 	if grep "^all:" $$($(2)_SRCDIR)Makefile > /dev/null; then \
 		target=all ; \
 	fi ; \
-	$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" $${target}
+	$(MAKE) -C $$($(2)_SRCDIR) \
+		HARE="$$(HARE_RUN_CMD)" \
+		HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" \
+		XDG_CACHE_HOME="$$($(2)_SRCDIR)/.cache" \
+		$${target}
 endef
 endif
 
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
