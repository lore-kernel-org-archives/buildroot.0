Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C3B606A326
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 21:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UvXVeZgM
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F99040683;
	Sat, 31 Oct 2026 21:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jOiB9GedTh5R; Sat, 31 Oct 2026 21:03:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D55184067C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793480631;
	b=EI+BMRunL+4GTjQ61hAIUq1Lk3Ok3ZO+RJvMcfq+0776Z8X4vtWtZN7vSOqZSeh23EB2
	 1iFRYgtL48ux490DxpD2V9mXxfDeASouN3mY3hrlEP+X4kljwt/BRJttwExc0oHGqDYBZ
	 c5yqzFaqGWIKMQmbzFF//DRE/gGRkq25Mhez7s3onsvFFGnf4nsxgTAQsJSkN3+M5lzkz
	 04G9/yKhN0vj2QtBQDJt5MtH7pvjw/DfELVgWcC7xIYswc6NROfmkqQzGXpFdDfTGysC8
	 x0sZJZhfrRoM+Mz1iOKkaQjfFOxoxibjIzym/QjPbsHybfcfhzk2OFpVoBhgeE17qYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793480631;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+eh30T51C1VJVpLU4oMZBcSv94hJZjh0KboX+SYlohQ=;
	b=FSoLE6x39tXMtMlInSHLwrNhVlVNVTbi0gZOMKQc7FZEfurZbYEMAnGGx6ybd2TlCR78
	 b/xAnZwOIB5Z5QiN1IAhfthGfh1zvhuY6xroQnEcPvyHrgJ65R/Hho7HYeYFJxUX++2/i
	 GEvxvlCMc9/BtLSFOEqA17U4TS7EVbEpCZpYKw5y9qPAFvq5ly3+rbmomtd23wxA4J8yo
	 DkgWV94mP6J5tswNQkqriFoCuK26a6P7JwWpSjr6qqD0FE9O2e3e+Fk+7Djvi9hDViAAs
	 B2Y7BV80LvrHmi8QnYatmYHu0Nrkl5LNgBEaOse2E41l81b6XZ9w86emZfDFoaJ5jUg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793480630;
	bh=+eh30T51C1VJVpLU4oMZBcSv94hJZjh0KboX+SYlohQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=UvXVeZgMbTVMfnilhUv6DIZ+jlIGI/vCfLQGGsvOvaYtJ5ViXB0rKYoDIjLmtM6Fq
	 oiU7FcUh/mNN9C0t03ZuXzDiLl+ApewKiooaFrbmSJyZSBBwywb6tC2DQhNpE2j1U7
	 PIBoz0D94dCCv6v4CKf8VUFi0mT5YR5uUeg1ZRUeD7jb8Nu9bex4Et/ENjgJevbiWR
	 +KU95jbvruCj3kUOjrVgy2A5fYcnXuan7U131KY7iYyKr6OQg+asOM8RgZObkeyTUD
	 txpVkBfZkOo617E7Jaa7R9GFhP1wxhnmrwpp4BrV2r2d9SCxpxfg+LJgzKZygsGq30
	 WxHzdAPwjf/6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D55184067C;
	Sat, 31 Oct 2026 21:03:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBCAB1DE
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 21:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D15534067C
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 21:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vpDfzrarsDNh for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 21:03:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 442BD405F6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793480627;
 b=piYwjF9OBasrfHhWs50lixABOFOIWUupAKQ3Cqo8S84LWqLwZgpWTa3Q124fSny88o11
 fX56seBc/V9Ux77EsshQLHyvQHX+CW5lckehFGyVSHD0ScoPYQ6mn2rnz5xhD0Vu/S9fr
 uh/rXCZzCXwc2/ogl6VolIgU9XTRdVS5okgHfO5dojJgdCrWQTGYb5zlXMTVqxYdO8LGQ
 Q6BauGPM4jZBHsCdUPjOiq+VI2sMDkpOm4lZahZZaG7lkU5lUdqMhJhatx0hPW8QhvFD4
 GDCjgtSCL0xh4oseRyDyeQFBtUM4Zg37T1iTpZU0X28WDx/G0WwlOkfNHhl/mYrIipQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793480627;
 h=Received-SPF:Received:DKIM-Signature:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=/qhf6FyFHxq+kr5eWzUJkv4oENOl9syeGsms0nsJpcM=;
 b=hT5zY7WweM7Gv1G35Jd6wP+bynYxS6+2gLPPrRwdd/lsjF5da5EbXVVrKomlGEQaElOx
 9vjZR1fF10MDVyQPvF2GCEXqdrRaZAg4Dx4qIFugFxPsZYO0iPVqZnrB43aBeCLLRzSab
 uNs4aSZqEdGeo7v014kyVt+Dyu8gQBFoWKpvFx6bEQ/VCVoXRJCkGeFU8AjkmLG+4d/9I
 kmpsa4dQF5rLhhI0N6dSHK0/CUTM+qaiEY+X1K5qbDWcjTZO/OcQkHZ10AZDt/gAekBeX
 Oh+d9kyBXCprx+6lN0MQIndxmdej3qgg2FThVvgHgPvv7VTHE+tp1sh2v0+5AFrMJQQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nDia8p7K; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 442BD405F6
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 21:03:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c1b2:c247:1f34:4379])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6DB535FF88;
 Sat, 31 Oct 2026 22:03:38 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Oct 2026 22:03:14 +0100
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
Date: Sat, 31 Oct 2026 22:03:14 +0100
Message-ID: <20261031210314.3994785-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mesa3d: fix dependency for i915 comment
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_REPLYTO_END_DIGIT,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 52ae9f49b215 (package/mesa3d: i915 Gallium driver needs llvm)
forgot to add the architecture part of the dependencies from the i915
symbol when it added a comment when LLVM support was not enabled.

Fixes: 52ae9f49b215

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd@kuhls.net>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index a62956bff3..a1a5db232d 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -155,6 +155,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 	  Support for i915-based Intel GPUs.
 
 comment "i915 driver needs llvm"
+	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_PACKAGE_MESA3D_LLVM
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
