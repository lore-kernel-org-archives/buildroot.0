Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B62B606EE80
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 17:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kWlKyEFj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kYSOt0wr
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA32081135;
	Thu,  5 Nov 2026 17:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WitRoxM1mqyj; Thu,  5 Nov 2026 17:51:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0E20781115
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793901065;
	b=qtAliBUw3fa3MopELeXtA72ml7JmNQYSNHuS9siyVUbhNK20pSYv3Knp6y8FjFIO7zHK
	 42J+eJ7NTtGIzaH9K6V/AS+rpp10fYWnkEV7I7kdwZ152fct8ZQCEEcWs+wB+TFVxk1dV
	 xNlGbqOJMIPTy8F0ZIlEiXs3jzo1XnkmGw+jSJBjAWFEwMPSHs9HgrUbq29OGHTSnWJS6
	 9IyZ/2ghxi7hltK6d0JdeNbq03XpACWskWLpfqR6/NDTaQZTg4WIekUSkHm6xAbiWfY1b
	 sD2mlDre6wf6xneBRW62oYHxQ9f19RXi/uNgUzpA2UqpdqViPpFu6dbixF1HBg77ZWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793901065;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=lOVJxRdn0J8xEnnNJAp06JykgaKCbrW8dw8WgM31F24=;
	b=mZWlK69+uJ0Tjjp4b3w64hJjUSwYMGeRHyTJ24AJdNc6RRO2xVpnhor9g6NI1xOW7ygC
	 wBFc8BklrYAoWUhDCy9jsTnWbL46U/PgHZoq51YqDcB3gcluvFZu9fyLJhKOvYQUCNrzg
	 ZoNKyKgBL6qDu/3k27iOLQzWJvVSemZ+gJMRFBgrpXe7yZEFWgt5QHHhQV+mD+B5nih3/
	 h5ZOdX7RzTNLl1A+hJySaSjPlhQP1r2+r/BLqq+GoLgkgZGDqzNW5ycSYsez6krZbQ0uA
	 gPKhznwIAOhJnGF+jGmIV717KWMHbfpqGrlq9NJU2DUM9MpZRdgmlMsDq1e+XtJMJ+A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kYSOt0wr;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793901065;
	bh=lOVJxRdn0J8xEnnNJAp06JykgaKCbrW8dw8WgM31F24=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kWlKyEFjdCCeIpuNpUnaa/cNSuJ+MC3hOo4D9alTnqll43S7eDnDcHL7AVteVAc1U
	 Ia9m/urCksOmWvj4n2eMruggJATdcfA5mTR1RdJ2Kd5mVTNsBg3rYo2IsHqEag8Awe
	 StbDOtCUyHEKopTlNxE3dYSctfdbMjCriIz/Mb6HiDmR/wkVyzuTOs77ygOmXKwbdC
	 ykce2Mz+Ksvo3TWccVoRZ3k+7yYUEHY1x1XYxqbiSM+TJ7wwyE50cJJS8IOveGAbkQ
	 sWiplHSOqm2Fdfn0n69I6aCWxcf9EtdlBhBwczNVgSnaBwJMobmKvXUH5BTAZFEChH
	 Vdl1/Q57C5k3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E20781115;
	Thu,  5 Nov 2026 17:51:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DEF731F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F52581115
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BKWIdtmDoaGl for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 17:51:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2EF4681062
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=kYSOt0wr
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2EF4681062
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 17:51:02 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so16876715e9.2
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 09:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793901060; x=1794505860; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FMLhmlT3heL1ve7tenAhCvVs5aHf+Q7dv5YPDzrT5cc=;
 b=kYSOt0wrG6Rq81LBvmW/OY/cOGipw5Tr0ehKfebhu22x9rCPDP/4HcVxdVVW5uDoC2
 FLuWbZlIhvplmK2HE4rn94pYsbTyeypPvSSk+hUEEf/dhwayzwXsy/PMSNynprNpYB+g
 I19DnLTtKEqnu3OeCcaQq7Qr97jUy6+4UG7F4A7hVp/qeQzaZNCsgB+vKRCbs3nyvjp+
 GH2TWYb43Q5OCCLVHhpYYxtmWMhlJEcV0eGsGgwgOjoJ2uGlRRKb9+rDJ0B80KmMSVMb
 fQE7A41v+sN8r22ljCIMfR/lXYVb+LjItnIaMUlFaT2xUQNFois7jiT1E85kvwu35Z3a
 F6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793901060; x=1794505860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FMLhmlT3heL1ve7tenAhCvVs5aHf+Q7dv5YPDzrT5cc=;
 b=J7+DJvQWUh/tD2OrVNSFH4r+G0uq9LzvnIDhNo33gwBZM9D1ycvSoxtpeDIPIwwBt4
 AKXh7pUprJgiBkeJV+id3FkHbLr0eheBZlNx6G62wwr8XD7K1P0r+G3UkOlfEjysemry
 B31LkNZpq6Tj97leJxXecnnpDDHRlk4oec0EPWG9x2N65mFGGoxp7gvc5KJqRyEUz3Wj
 aeoy79DgANyIXMmcNt9QuhBNfoCVQxFTROqY6nLJuSJK+7NqXpGxfAG1A4wFDQpnrbOh
 nbfVyGv/tn5bwfoSLdYRtIObLuMUsA6YWfndZ9Ur2QcONDVqnWRee0I8XnhhEVh1k1oW
 CR4A==
X-Gm-Message-State: APuU4Z9XIhERap0I36XsrfOIt/rAeIkZ3VOh8nsdViBiXEwaKRMILT9w
 xucgZ3sDXZOUcDEgpQ2w6do943bupdBxKbxuAOZb8U3TQk2tBptnu2i5glR9WA==
X-Gm-Gg: AYBFou3KmzgbzGTkbsMW81kRrpkSeTL+Stuc+1HULNbDP+vUQQjL9wFZRh8f/iuLFQm
 aROfLpP51IdELRULjV9XoANxAKtXDOjTjoHXogCWAHjFVWirqh3l4krmq7tbd8kIbWPLil5IbL4
 0eTUYa51E6YMR4u6Jj9O4B+mDWTdyWJqag/B0hPpD7fjkzGxIW4F21hPVdB60F+Yngw7IzLH//K
 dgpWUJFWIkF20Xm16f2C1CnpCr3eq/HP0H8o9h20gDrJC47USbKVVieZmZONrr3USYeoru/T+tT
 ZgIhOA+nOzWwNYsqM5mZHnTvPp6+vGn6QqTvTRWhurG/sPPtI+oEIiV92EYzZ0oxctXNmJFHHIO
 qyPrrjlnRMH+hG1S9icBrdvAPoYK5WKh+c3f10YkTzMyNvyaNrS6oo//O+2DKkg9IQLskj49CbF
 QywCrNiZH+NMGODm+6jXE8266YjBaXLDq2kO54orpA/WO12uVp/Rdc3eq/SIe2vHOvwqffKamTI
 dXH3YWwQ9/Zf/zYOn8BTus/s7d+0WKzGyOiK1MEyYF7Apvm+hs1CAhRM+aEtjTopybcJ3JRniYr
 yB/epJf9yWtT2MIPUGW2YdL9KFsk7R/+WOA+sIdX/Mho210jMRmMEZg=
X-Received: by 2002:a05:600c:46d1:b0:4a3:59c9:a754 with SMTP id
 5b1f17b1804b1-4ac187a72f4mr433493795e9.22.1793901060378; 
 Thu, 05 Nov 2026 09:51:00 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b4134ff2a3sm124325235e9.2.2026.11.05.09.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 09:50:59 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  5 Nov 2026 18:50:56 +0100
Message-Id: <20261105175058.3132718-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105102458.1795886-1-angelo.compagnucci@gmail.com>
References: <20261105102458.1795886-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/3] website/download: complete the git clone
 box
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The copy button has rounded corners on its outer side only, as the
end of a box, but the git clone command next to it has no background
and no border: the box looks cut where the command starts.

Give the command a gray background and rounded corners on its outer
side, so that it closes the box together with the button, and some
padding so that the text does not touch the edge. Move the shadow from
the button to the whole box, so that the two parts share one outline.

Without its own shadow the button looks small next to the command, so
make it wider and its icon bigger.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - none

 docs/website/download.html | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 2482c0a26a..0928982e8e 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -140,11 +140,11 @@
 
       <p>To grab a copy of the repository use</p>
 
-      <div class="input-group">
-	<span class="form-control text-truncate" id="giturl">git clone https://gitlab.com/buildroot.org/buildroot.git</span>
-	<button class="btn btn-secondary" type="button" data-clipboard-target="#giturl"
+      <div class="input-group rounded shadow-sm">
+	<span class="form-control text-truncate bg-body-secondary rounded-start ps-3" id="giturl">git clone https://gitlab.com/buildroot.org/buildroot.git</span>
+	<button class="btn btn-secondary shadow-none px-4" type="button" data-clipboard-target="#giturl"
 		data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-trigger="manual" data-bs-title="Copied!">
-	  <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
+	  <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="20">
 	</button>
       </div><br>
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
