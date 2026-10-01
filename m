Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5FBCA5FD4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 12:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D34540D7E;
	Thu,  1 Oct 2026 12:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TT1ZjtW9Mpsp; Thu,  1 Oct 2026 12:56:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4084F40CC3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790859391;
	b=WW6sONwwuLETIIlH4AupbqN+JZoYNrWilsDSHD/QfTceelT3ChizDWKxpph+iAF83LhP
	 hle95I8agweRs2tKZ2Ej2Ja3DDVw15gUXmGwE++potIc/qJeCzL2xApMeH/tG54W88+s1
	 7W5mUAfMzWjjsf5TV4hGaI1bAAer7Z8roLeyqthQiSa62OTIwQCvbnl71HTXGpGdDUUwD
	 MX2tlHMqJJii7kqyKibrwglQgikrye5q1iDbaa6rs82Saqpd8k6mzq9Md1GZ+0Cea9sXO
	 PAmI8pSsSupDr6Rucli4XjEiRMQWfhZ3lqmKRXIbXLrcXnRvp1PiboYdz7O4M11knpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790859391;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=GzqLeDvBHrHFf1FGDD5DarPcXqBxexKSxsyMVL69hbA=;
	b=cbgwuV85qn1xSjNr8gIY1JgN4jwRclBQ2t/hXa7qqudkkpvHmNVo3/0b15oUMa9wb9i8
	 DEoSYHlLKqnoyDg+enSaqQngw+cRVH6PIhvENsYXeslaH2rRnpwyVQ/USfhsTSQPpShko
	 1KutNSE/eWK/bGE+QzA2YjcS2m0oFMdOmqrQ1wF6ARjnQPswCWS3AbbNtKLCvKL0vp/OH
	 E8SPIZmxX1R8NqoULwHHlhymJPlo+ASEeBcpNlDbWKApYDfkUH+z9ke9HVQbWt2+8Gkqj
	 Vnfx4h5cA7zB63qcdj6JscN9e2ZSd41mdFqycsTYrjk2H/Yp7VQWKhoCoBSsxY3UqKg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790859391;
	bh=GzqLeDvBHrHFf1FGDD5DarPcXqBxexKSxsyMVL69hbA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=JlZdY2EbUFHTplZSZ5XB8WvN8wWvQwDCXePKAZqVPMFM5WPgpQIOIM6SNCoR0MMur
	 sUVefzFwrUZNt8qsReURWHdBzBmiGlJtlWfYQrRfnjo9WMxBqeMxKUFROksxfGoMAd
	 jtrUg/rRFx3AEwp06scQNP2G3BZ1pVkEtp8zlR/LmaFxZU5eBBQdTz5UfQ7Fa3UdCi
	 tOh3s12mSDFwwC6EO+8+zVbxfbrfaerUMlWESi/wJXc7RF26WG8591w3Cc+YNxcFC0
	 cN+BCVZpH37IXhqHSau57N9qNYgJHqrRYLvVY13KBbpz4B4+VhsJo83kYYoaNz4Od7
	 LS61LwbG4uUtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4084F40CC3;
	Thu,  1 Oct 2026 12:56:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3146263
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA16240BEC
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5iX3eoSJpB9 for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 12:56:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6EAE440C9C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790859386;
 b=lIi6WB/i3Mal8of0EQPuRKTAwKKvOZ/v4LyoeVMfBAXLxoCtO72t03iXg8aflzwtAneb
 rL4c5pE6/IDh0ggoMkSkosVTq1K9Bvazl+7UUoRoJERZnMXkprSfaZHop23HFWEZ0Gsav
 I0sTDskV2oXxxee++XxRhUpQvut+vsXy8f4YxluPIsUFwUo763e4xTZ57i4EDObqZttUu
 9oRGGYL6Q3RyPErEVr9dMUiJ74d9QUULlV2fjXb/et6NhHpjnwRI4aPTB9Wfqukopuq5i
 HFOro432FamjhNfsxh1bdO4yXxqmYqg6m+/S1SFE6JQ3kUOqe3igv2hJHpQQRHBBWJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790859386;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=48evOzN2c8GEe9++fpIAkCInOdZRR8WXCvPi92Y9TM8=;
 b=kk5oy4ESP2/MRDnq1BoMGoMEomW6iHvLFuGczF0zyIVXH+X4qgtTTPjUioPcwRezxFGK
 9HHFj590ZLB4u0Zr3zoHc0yQkT7D7nLmH+l2REKCtqMS11p0xYYsMSkg4Oa7T7DOXyHgH
 +HO4+5y4RnQteLYGbWl5fF11wC48ECBa/TTYyL98EAi7KejKeEe3Tgs40dCQDJVZEICuB
 IX1oxyqNYjzVQ4RmA0zghspzjFu4sv/nZdb1GXZ6CR4/wTfsG9WXUtdtmCbHtTWghXKon
 TGoEocE7BXGHa87DHrOOKNUdwSiLNN4HLoqctkIQJWeSIn9LrlIYoghT3Ueo5kfQLXg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b="hSTj/MMU"; 
 arc=none smtp.remote-ip="2a01:4f8:1c0c:5073::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EAE440C9C
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:56:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0EF211814C0; Thu, 01 Oct 2026 14:56:24 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu,  1 Oct 2026 14:56:04 +0200
Message-ID: <20261001125613.2347873-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001125613.2347873-1-buildroot@heine.tech>
References: <20261001125613.2347873-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/4] package/sqlitecpp: disable stack_protection
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SQLiteCpp has an internal setting for stack protection which
defaults to "on".
Since Buildroot passes this options itself this is not needed.

Fixes:
br-test-pkg/bootlin-x86-i686-musl
https://gitlab.com/heinemml/buildroot/-/jobs/16865965418

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/sqlitecpp/sqlitecpp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sqlitecpp/sqlitecpp.mk b/package/sqlitecpp/sqlitecpp.mk
index 95ddc953cb..418860fc6d 100644
--- a/package/sqlitecpp/sqlitecpp.mk
+++ b/package/sqlitecpp/sqlitecpp.mk
@@ -14,6 +14,7 @@ SQLITECPP_INSTALL_STAGING = YES
 SQLITECPP_CONF_OPTS = \
 	-DSQLITECPP_INTERNAL_SQLITE=OFF \
 	-DSQLITECPP_RUN_CPPLINT=OFF \
-	-DSQLITECPP_RUN_CPPCHECK=OFF
+	-DSQLITECPP_RUN_CPPCHECK=OFF \
+	-DSQLITECPP_USE_STACK_PROTECTION=OFF
 
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
