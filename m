Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5AB606A31B
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 18:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W9vcxcgH
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79C06407E5;
	Tue, 20 Oct 2026 18:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_nTC1_cVwR9; Tue, 20 Oct 2026 18:34:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8744E40776
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792521299;
	b=SSg5FG26x+xYkTuxxW4P7LwF7zrmJ3wEoOOMr6dR4NucmgU4lyBTEOHS/jGnLzf+Y4BF
	 +xSo1m6yuVKnyMuQbl+I9u0QdwW6IcD8E1npZ+ozo7v1tA6tKoLbjiJ7cGbTef5tc/5zk
	 8kDACOcXrgWACUjcwYXJfIdTONJ/yvkZDYrGwh3+uAKVWz0GtEPEf8+Ryk2F0DmSeJ3LF
	 pxA7TbAaDTZPxHpopC/5CHiEVZlIj5aR4pcZ8ai/oI4NAF6EBR0usS1iTE9TAd/nQ514x
	 W5iLaDucwQnpjSx3D2gWCNvTB/PqnjsbAAc+Hjd8goyW/krTZYlp03V6lWc5uRuofiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792521299;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=D64ziCnkna00BbTWPQJ0Tvn+VDZaV8nZyt3YesAUZA4=;
	b=Px+2ahKQFcaSw0gxRVIzJ97nDfSmq2BMCVgUd7iz6RklfT846ouAtseQPmY9rbiFSYWn
	 advG9oSq/jujSN3qT5DRf/ApU/WP2d6RwSOQMyDtqAqAy+MK1weo2RTJYkq7KaAvWvBjK
	 VTbvqmHaw+K9oTeaITKKGdTU9rVPeatPo7E9gGAbqaNdbD1uyWs9PLYlie2wkiWedZcPS
	 BlRxdBBid2oXPaHbf9WGPPS2TB3++9Cgy6bEpkqigjl3IEaa9jsMuQ6ONYPU59ixJ17cX
	 5E0deayDuLT+dv15Um5zArXotpQTNp/PZ+6cuPNnlI3RyIpgTwpfLp6zxeoAZl2MMNw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792521299;
	bh=D64ziCnkna00BbTWPQJ0Tvn+VDZaV8nZyt3YesAUZA4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W9vcxcgH3AuXLavH1r/C5/8Y3QfhIUB59FciuYmG/DYJq5DQCgKRdTappgH/2iL08
	 MnzbJVZwc5A3a90d6+g3K2qvLYyY/TULTS1Kz+DFGytuq81MqgAjizb0sxuzinsLIh
	 O3VSvfg3QkSjIscfh3lMSo1HpAYFyxucFJz9DAjE14MjuuISDETL7KtJSdPndC8G0u
	 LuwRPKAiDmzaR1JSzKitAP/+eZSvB5v8QA3IyDV7TVkiOxWvnYbNShL9d3Hr5mw0Jx
	 ThVR+GH3rN002QAuOdkK1lTxSTyezHS16YFMQ0trkOQBFDJcHBovncfdr3CK+NoBzJ
	 1lvDjwzG6XQkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8744E40776;
	Tue, 20 Oct 2026 18:34:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57A48255
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48EE7407C5
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-zAe2I3RL3c for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 18:34:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7A57D40776
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792521296;
 b=SYPAOJW5G/2Lvhhi7Y4veq7sLG+lcdR3jGgiCWo6++vNdqR7JYgJ/faxvo4pHLLMa/Pa
 P8C9gzxdPP95iL6qxBh2N6R6NOr0GN+s877nSERvcR/qYIGv0zGDFAjCR3bn65F4bqCQv
 MwDv+pt8J9svxX6uOS1X+oGSYrrgvWSfrVfzmwBIsA371/DX4LnUdSvquEmxEQHdCfLCs
 K/0aKhUQJtODz2LjRCohES4vax5C2ZpgtyPF1ME5PEe22tzx6KvOdEGsA6xInHve5fRId
 B1SVXLOZ5YlGbnYJ28QQkzA8rsN+O9QSm163PZ8FTWyuMR0JPXmlxA21JtmJC/phziw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792521296;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AHwtQDHeUZENQMlpzJs+/yVH8/eOvGmjigWoi2MVVNw=;
 b=kCCoQUctNSMxdqMKm4lMTsYuD0Nk20crxQJHWGgplKv+zkYiS13KVeD1hvK0+Tfw80Nl
 TXE8yk3VeJithyhoyZRSTdh7hcGgsN0DO19g6eRbZL3bxh4vKG9WnRFHoYDFNatCDgVUa
 1lVMsKSjJT89HcC9uy2v08rhGp3ARkRAwgfC1kZxefY+SAGHjBO5Jqn8p7ZU9Hjx6Rczz
 aZYsEtcGKDATkcAp0W0TkyUej4T1yablN+w70Sie61B0Qi4vydF9hb7h8UsBLa3q4OoH0
 2lk7SRerhR7Im7Cw+mLLjx7C+cQ2x4f4EczPoUY9TbnFaP4gA4WYbQ2XBtd7qSL41TA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A57D40776
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:34:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AD9E99944; Tue, 20 Oct 2026 18:33:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 20:32:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75a25f5c902a1c2c147a0db71d3eae1bfcdf6db5
X-Git-Newrev: 69cb418bc80276d602ae9e4fe5a30b10ee0a957d
X-Patchwork-Hint: ignore
Message-Id: <20261020183333.5AD9E99944@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-hare: refactor build command
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/69cb418bc80276d602ae9e4fe5a30b10ee0a957d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In order to avoid duplicating the build command, use an intermediate
"target" shell variable to store the make target to be invoked for the
build. This is in preparation to extending the build command.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-hare.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/pkg-hare.mk b/package/pkg-hare.mk
index 14e0cfce5a..15dc769311 100644
--- a/package/pkg-hare.mk
+++ b/package/pkg-hare.mk
@@ -49,10 +49,9 @@ ifndef $(2)_BUILD_CMDS
 # but in real world, the target "all" is not always the default one
 define $(2)_BUILD_CMDS
 	if grep "^all:" $$($(2)_SRCDIR)Makefile > /dev/null; then \
-		$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" all; \
-	else \
-		$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)"; \
-	fi
+		target=all ; \
+	fi ; \
+	$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" $${target}
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
