Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C90606C926
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RqCyVJtL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hc1Vje1r
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01E0B408BC;
	Wed,  4 Nov 2026 21:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2s05OtKSybCf; Wed,  4 Nov 2026 21:00:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 263ED408BE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826039;
	b=jLeQ3kOofmSiDXBVuFPJ4MycEb87v+AAuODmqTBr+7/fJ2shwQnTZ1YVhgdFv79FZCB9
	 26PLSp5vD8qguj1mkP81i9PdzQ0eSVOYWDABAHXEDQ/nQ6QXCK7OLWAZd1o4Iv5NiZWXO
	 hZMK9bMeJxdztsb9bedazxnEWe9LVhQGBAEVJZfOYs8mGWZQ+D6Hr7+6zTqIP5VycxB37
	 w40BNoXpJjNZCe2Bhq5K81ipzSfrJfC+ytnoCzROO92bgXZOESFHuyajUk9so3Kc3l16i
	 d8FX1yZBof7sJfZYvTyk6whDX+Fi/cekGGMlvs8hpfMjmT+Irnq62qft69DcxoDh4qg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826039;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=121Ox2WY6oS7NZHKbOnlyVzw1aKp0ZvrURkgMuPvJEg=;
	b=K6JkNhyQHk1eABjN8eyBnUS+XU1WindyMNY84aehxypH09p0YKS2mTudSjOuYZoIUCa9
	 xwHTNpr7IvZvud0BRAb/dtUhOUn5c4wnvwMWMDqBKV88oSsaz8o8LzxJ9Bb9qe1uWOY4G
	 G0+Ol8+Qf6NLzxuuPNWD1QY1BF9g9zp+n6pDyQXMARf0KHE9R/NuBbI9ODBb7fgx1bVHT
	 3+eTjSoWaCetHa2rqAQLpVD7eSIHNZo9GGht4ARJb4HZO0vITD60Fe07I6qeGM7nxFkno
	 w53qfETGWkmbV5MYP5gc2rxpD8Je2hd1eJO0zBqz7mShmYMVnzUDpHkKRFwwKm6DpCA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hc1Vje1r;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826039;
	bh=121Ox2WY6oS7NZHKbOnlyVzw1aKp0ZvrURkgMuPvJEg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RqCyVJtL3ehnU8p1ovLrzu1buQZruCyelOPIXurrbhnT5ZZC06HlLZ6X/9zp1R6NL
	 3/J1FMeizJSHYDfDl6iDkLaAx8fQwGEKw839DaU6fsF35riUZgkCY0aV1thkPvrKAI
	 OTIn97AWcxadKHjVuBTc5NUlmvVsai+36lzMYJa9rCJPTNzlCw2qhyX4jtVhB2/gEF
	 /VSzldjl1t4mer5vjIpDT7N4W40R8AVxLgNU2V1ZDIM7h09k5V+OiR4dYuDbSXxWM+
	 TQ6ZdVABiZay+Pyu0oD7odIyznA9ujBuCPpNGNlhlb0RudhovyV9klnFrTw4aHEjxO
	 HSLIib6f9fSTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 263ED408BE;
	Wed,  4 Nov 2026 21:00:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 038B931F
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C34B5408F9
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFfNXf_7mP75 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:00:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5DE69408C7
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Hc1Vje1r
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DE69408C7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:32 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so726823f8f.1
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 13:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793826031; x=1794430831; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7463je4VDSFP+6SuDZiyXqM7a94m0B+atGFuW1npDSc=;
 b=Hc1Vje1r2Bk5+DpEZC2OJKL2gpfUtUGSzByX7v0zCslknpy9bty9W3lBbzjC+MNu12
 Z1OU8y7k0ITDPWdMuuJ6mRHvS8rtqxhHUPoErZzj26tCT5KCk7rOk1hcoWTYsaOpUaRv
 Dh3fg2HknQtoaq104S1Ny9HkNsd7ALz1y/184XdLLrfnO0sz9q7KeOxSADJxkchZpUQB
 A5q6NE8m7IHpu4vrLrTq3r4tYlRWbMX+qOfkiM9qcwqII/lL2RtI7AlC6D3tzIhpy1Gf
 87q9tKio+Zpeq0G61Cz49QdZWeuiO3MYFMpm8d6e5J2iW1oIs69sY6QO6hPXZrQ0YxoK
 CirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793826031; x=1794430831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7463je4VDSFP+6SuDZiyXqM7a94m0B+atGFuW1npDSc=;
 b=RmgFspq1ZevaO8Ks1eQZDSSFqi1NYb7U2MPQXjpeSfdl9DaLwMviwtZGMFz+Sux7Vi
 KKhBpTgExPMCX7Amw0ITb/VpjquKHLg3DT7xfyPLy/r4jnlNg19yfiip/MFJqkOJBeC4
 o0eqUIuzTkzZdG/hkuzZYB9D6caQ09l7VyekYETTXqhfu8AykYB2T+YbXtnz7u9ZMXlJ
 ZetneVlmYrcGk1ehaKzlQ/ym0gVTuzJiKTPdoKgyWe0HqAM5mq8nLOhoC408Ltpth6Lc
 nvJTAP7t/4rXzqj/Oq8uylzrNlE/AlfwQaBk1MNjKdWuUjejS+Z5pTzLhzYut1abc3r+
 v8lw==
X-Gm-Message-State: APuU4Z9pRun9WqlS6ItmENOw6mt1O/Gt4xfHzzh+VCzS+c3RY0TzQgg/
 5f4Q8K97llec/Oopxk3ki+kBIeqHo+fAmJW1brTLvqxR+qrOcZUirIDGQZRTmQ==
X-Gm-Gg: AYBFou2/VQs4xWNxAdgs2kwhLTlMXwRwFmHQKALPrrRC+YTpsA/aWCb7YB7CHSRBrAt
 x61hlePIdOo0x79TMdnwOquT4tJyrtJgMrp7If/chL4A/AxnkpYntUluVcNT7U5UYZeYPCaqkdG
 q5H/rCMPinqNNQZHw8G9Baf6xOw5Af/3V8xvWTSE2S9xJ5i7W/8PlucxzSl2AS+V5gsoRRzT8+D
 e7w2hmIfWGNMFi20wCHEVpBaUKqHHtJKaIW1Nf0aQXhAz4Zjdu2cAkdvEvVKH69BKp7zmxsAMZk
 kx+Dp88Bg+GLnEoCGS0vNpI0GO7j1a6VjDRD7vb7WXV/cFxtH48rrB4YJvKoZTLBnJagCjaGMd+
 s91iyQFxLKIGYWx3IaJallVJFe9suo1P1UoDZamw3uyQky4u8ch1ytEZzCLqOg1klRAJ5osWlmY
 g8H6dltEOobhnhbmvZkLjlKS1WlN/81JmYsxpq/SToBKh8NJ1cXi7fJlbETxx5bzDmuMIa9vkfj
 SSwrCq6d6YT8UFVvuPT2dyQeYHFa2V34/cEqI4d8+uAE/QauJLadCB6D7QMmv27hMUMdXfU8S9Z
 VPdpU5UXRFBC9gvcqADSp3+cL/+z0UTfWzka3g5wfVdUm3f4ZSZ0mA==
X-Received: by 2002:a5d:588a:0:b0:48e:4e3e:45fb with SMTP id
 ffacd0b85a97d-48e6e2ff039mr37722948f8f.22.1793826030885; 
 Wed, 04 Nov 2026 13:00:30 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec8d8734sm6100414f8f.20.2026.11.04.13.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 13:00:30 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  4 Nov 2026 22:00:17 +0100
Message-Id: <20261104210019.3509258-7-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
References: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/8] website/news: fix an unbalanced paragraph
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
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In the "Moved to git" entry, a <pre> block is nested in a paragraph.
A <pre> can't be part of a paragraph, so the browser closes the
paragraph before it, and the </p> that follows is left unmatched.

Close the paragraph before the <pre> block, and put the following
sentence in its own paragraph.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/news.html | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index 2295abbf57..d7e680e41a 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -10153,10 +10153,9 @@
 	  to <a href="http://git-scm.org">Git</a>. You can browse the
 	  repo online
 	  <a href="http://git.buildroot.net/buildroot">here</a>, and clone
-	  the repo using:
-	  <pre>git clone git://git.buildroot.net/buildroot</pre>
-	  See the <a href="/git.html">Git Access</a> page for more details.
-	</p>
+	  the repo using:</p>
+	<pre>git clone git://git.buildroot.net/buildroot</pre>
+	<p>See the <a href="/git.html">Git Access</a> page for more details.</p>
       </div>
     </div>
   </li>
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
