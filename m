Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1422606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 14:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HjtJqtrn;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim header.b=R3aUD/FT
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6F7F8107C;
	Tue, 20 Oct 2026 14:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ByvsdCcbbbPc; Tue, 20 Oct 2026 14:49:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B616D80806
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792507791;
	b=dvKoVObTfIGCF5dTspV7n/SLDMPma0T++TW7mlFZFb7CNTaj7AfUAwafBRwayhvID/Yi
	 YOTwrvlCESOdLFAHM27OAuQznmsV788vGTKo7MSzO5ZrTze0anszohk0fTLpeiT+TuwkI
	 YnchdN/kWzamDIyAWv0mrXIhzXVGyXotndOWDAiDPdlutodP72LH1CAUe8cq7irBCorCc
	 FByiJRlin6vlEUsK5dbvQZBL3PFPCCsUjph3b6xZJCcEwxTKEiViyd87lr17TqDFIXueQ
	 Og02C6JFtO//SGdTVebjccMqPzerWQ7+mJzcFz2wosYjjwgfgtxNPRE3GG9FN/nFWTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792507791;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=v7zQ8kpvvC3rajh10lVOvJeVIfZI2Dz1P8VptRpBPL4=;
	b=TvHVcmrYOTxS/6ixE1dm3qaQK0jfRPSdh4i/Nqng7OVkAPYX57d8Q8AB+jfqWkBC7Ubt
	 f1qp5yC4jkH7OjqwAX6Ui+NCSDClWVJGjpg1Ybjx71UEbAPspyNivvy9srexjvoiiDTiz
	 xaBS3SUF66L4osAzvJRA0H2mGnE4Iq16h9U7g5VCUnQkhTpLZAquOWi7gCJbyeTpD7CJ4
	 fJxq6cU3kJ/7VBJivZmd87NoHtf+svosS4TvJxqtmNgjk8CtMM4E3ZRLe+BTUJNE0M4oH
	 uNmxpySMOoOJayC/R39X6uaQBnqHwjaHhiBB+pkm+d6lKXfzKuepoqkc0Ywn/g48DoQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792507791;
	bh=v7zQ8kpvvC3rajh10lVOvJeVIfZI2Dz1P8VptRpBPL4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HjtJqtrnSJ6IkSUQ+ROpLln7zDg3rp0T2bewMQ4v8yOdAP2rqjPOuGf45RybHPH3r
	 aaeiGkwmyO6867Tt78rw8T9LYH1UTxWCq+cA4RCaK5cVbJlxGfZtYnNweFKFircVuQ
	 1LTz8MBCADmhO5SmsD9267u6YlOouEeXfN8XwqgkB7/U5AQqhhU4pasuyK7igXFXyd
	 YhrjHE3yY8y/o2r0XXmlsTocj9YvDO9oC32/8fbP7xZGpzUDmHb1KEYR0qJq9ZSinZ
	 0SYdHizG+DvV8XqiLiDQN1T5AokG8FNXP9b1qHXIzleqm47EPgmBWthlgeFLJ0MY19
	 lrTXMeC3lJpGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B616D80806;
	Tue, 20 Oct 2026 14:49:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 645A01E9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49F7F408AF
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unw9kDdWMqJ6 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 14:49:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 00DF4408A8
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=136.243.2.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792507788;
 b=apKVeDkbEZK9zVOigt9smUQKCMHIRBo2tXucpD2PcrMmFuL8lWO+QalgKNwQbmN4U0Ny
 NFX5oOxoK+R0e2IcgWH/LOhRXXzt0OjHCaln7liq6uiq9myWG/31fFZeN+zQTOxVGD/Dp
 zm4IhFbHAXr2dPiKL/4aEDBEIW6RJW83qyBjasYpgoLqot0bU0dQiesoBqTnCRbOUu2/K
 0CBDSMlOMO/CxL4eLdZR1pusGfr/tnqviEnpqMz0nJ4ebtaj8CKtAJmfn3XQjnfupshfc
 DnQuFAZQDtr6XFGl/AYEeFGEehQ6w2Syq/p7bQly3ud3rP+6c6nqQnLzzvUoRYa/8bg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792507788;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=pJTjEsmCMFoUkuPpw7ZQdmW49jCF+yk0lOtKJudv2t8=;
 b=HUZvB7gESHzYbMA8893L8ci//tdWTgrO2AcKLFv9QM+Y4onELGUkyrpsOlXXnriE08MH
 ws2Zc1Vd/gjSq4zgOalP/qVA+BMKo+iSpgmsg922kSF6BQODhH/NYWOM7h918ylplyiYC
 c6u4RkpcauQPsI+u6JlRVK2iqdaS7i2EEghPYoZdGIyP5TAHY7j0V06viH2tU7FEvnDM2
 2Ywdbl899KtGkTfssHxHdDqEKqhH9FnRVI2gVHf8zd1F8Qfc7c80Nk5hBP6Y94BxnUecg
 WDqAh+8OSa3pkER0CfgItMvR9QZbEYUI/RHiZRZ1tTNBH8v0AuaB6rA686b998vFfNw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=n621.de;
 dkim=pass header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim
 header.b="R3aUD/FT"; 
 arc=none smtp.remote-ip=136.243.2.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=n621.de
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=R3aUD/FT
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00DF4408A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 14:49:47 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 8541DE0018D;
 Tue, 20 Oct 2026 16:49:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n621.de; s=dkim;
 t=1792507784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pJTjEsmCMFoUkuPpw7ZQdmW49jCF+yk0lOtKJudv2t8=;
 b=R3aUD/FTzpqheKQ4QMFPH6eVGisz99fxdLtVqg4Bfhw4x6UmPj7hKxsJ+g1lo6P3iTmymH
 aID6mcqDpmdFRSMUVXrw8C57SMzKkeldvHoIuJ9W/AOrULzELzQ8Z39siYjBw6tL57tMn4
 1cV877BNPontl8Chg+1JyBzkvZZVggI=
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>,
	Florian Larysch <fl@n621.de>
Date: Tue, 20 Oct 2026 16:46:55 +0200
Message-ID: <20261020144902.10111-2-fl@n621.de>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] ca-certificates: remove roots chaining to
 eMudhra intermediates
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Remove root certificates chaining to compromised eMudhra intermediate CA
certs as suggested in [1].

See [2] for more authoritative details.

[1] https://emudhra.we-have-a-problem.com/
[2] https://groups.google.com/a/mozilla.org/g/dev-security-policy/c/0R3XLJL6FuE

Signed-off-by: Florian Larysch <fl@n621.de>
---
Note that this is a fairly drastic way to resolve this that might affect
a lot of legitimate certificates too depending on your application, so
I'm not sure this is a thing that should actually be merged.

Just putting this here for reference after discussing with Thomas on
IRC.
---
 .../ca-certificates/0002-remove-eMudhra-parents.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/ca-certificates/0002-remove-eMudhra-parents.patch

diff --git a/package/ca-certificates/0002-remove-eMudhra-parents.patch b/package/ca-certificates/0002-remove-eMudhra-parents.patch
new file mode 100644
index 0000000000..46ff520f56
--- /dev/null
+++ b/package/ca-certificates/0002-remove-eMudhra-parents.patch
@@ -0,0 +1,11 @@
+diff -Nru ca-certificates/mozilla/blacklist.txt patched/mozilla/blacklist.txt
+--- ca-certificates/mozilla/blacklist.txt	2026-02-23 16:32:21.000000000 +0100
++++ patched/mozilla/blacklist.txt	2026-10-20 16:21:52.412423854 +0200
+@@ -2,5 +2,7 @@
+ 
+ # Blacklist explicitly distrusted certificates to explicitly ignore them and prevent build errors
+ "Explicitly Distrust DigiNotar Root CA"
++"emSign ECC Root CA - G3"
++"Comodo AAA Services root"
+ 
+ # Expired CAs
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
