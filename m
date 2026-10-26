Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD28606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 21:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BqSqsM2f;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jHmZeLW1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B52980ADE;
	Mon, 26 Oct 2026 21:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VVsJ5BoQc76; Mon, 26 Oct 2026 21:52:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A653480CF0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793051553;
	b=VMYOCzBz6lZaSN+54aZtmDHJX6s3m5a9Zt8JX5qW5Dm13JVknnt8j3grHgEHFpyhv4Dx
	 UR7dStrWhyy22vGWOCCdy80TpP6TNKO9Ykk0Ipf/S8jjb8CBqZs2cWjFIDmz5A200IN9P
	 wdlFBsjCZDc253eZ2VVMMSEf26heHszDL1g66q8LokPXsTp2gcn8Xmb7sVkadCv0RVkm6
	 ULa0a/7+wuLIF427dHNi5vrYpcVZKQqf8chaHLQ4HAIqrZU67yl91FM8NTp3Dbzww/naC
	 +8TYG4yORkHcWwgg5eb712uHXb3MWIHMAgfE6diemyGjK9Y2vKLSUVcv2UySFWU3jew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793051553;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=biwVzGxFdzD/XaLG2ZDOZkjAvgsLaNLjprDFJYqJsOI=;
	b=rt4vuxflInHq6WAhEEyH0kde1DpXaTJzE+hEIcrWb21vFYCi1UwiLOmD148ncCCDGj7j
	 z9FUo7s9AW7I+n2bstKrH2JyQO2qrM+0mbInwXU/FLa/xuCFfyVCKkjrubMijmOpr5epF
	 sEqaaeGttvkBCNbRdqpZQwxam9uBewpIpo3VU7AWwiwAclT0pzG1v7y3YTAdvXTfSO/Pv
	 bP8Z3Bch9IOdRWnkUAVg3XCd6T4XrySg47FY/fOg1meDkl9Wff1g584JvsrZh58R4BWH6
	 WuLZ7uNxYaJmed/T5L0QxmnQQvrR92LjOPzjSSV5VAFKS67osv0Pp1FE/mZtYiSR9pA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793051553;
	bh=biwVzGxFdzD/XaLG2ZDOZkjAvgsLaNLjprDFJYqJsOI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BqSqsM2fxkFJuPhFe7kzY1OjPaHata1KKJKoLeiwAGpM4r5IYPmv9yuaM7l039hw6
	 webrRPlGK6Rs9FCp6RHz9jDWcHuEfn3p65tAD7/xvuP5VeiZfPzkB3wgq634sC9KfW
	 ToZB5+hs4xm1+dZ6bvUbaCazQnoE5/WmspiynQ9wCbMVPJzZXlrCnxFO0cd21Qpxss
	 HzNaciJCG8GQIHMxNdfDzUwZJ99+VCZnucTe3D7bv7/IC9Ro7Bxn3HRhkpOGaAS4kI
	 lzA9gMnlwxUI8ooaJFT+rvVKvRQc4Sgtf09GWdXkz+7iDlsbLv98gv4ZIy49ULfK6P
	 jJvrelMEjonFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A653480CF0;
	Mon, 26 Oct 2026 21:52:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E91F43421
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF1B44061D
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUfcdwcQN3dk for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 21:52:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0BD374060A
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793051552;
 b=hCv6dEpPXTu8JGaoNkJpnIs9uqNEwPwMpdW7s7My0o8TS/zzXzL6GhPwuxkl0PoOhIAo
 BGt6tfPBaW6l5He616pF/SccV5r6sKpum9Um81USUtf+2Cd1h34n1eb7yA2rr0F0BMret
 ZhPrWBOd7oY3FFki/eH3/b/04Xy9GYbAGT+d9iv1TW1Pmt8w9RlfhiPoFca0drkq3Fn2W
 /xQOIvAww7JpGIlah+LEmP9QKM8IxeNl2MbbCKK9rhkvTPuaONruAlOn3tsrlii5Z4N1O
 5EXpM7QUeXnTQ7FShCKTQYk9yhucC62hvisW9+a3bI/50PGvdRnQkqzfrXw7V5LlDxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793051552;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=LGi/45bKRP+yA2RyJrdJye4AlfbgQ6mr4ESGylppsQI=;
 b=bcDL9AW2TC4XtNis0QeFYlaQkeSO88mAP+MsNKRSWESHgfUGY23+Eg6y1B5uKljtKsAm
 cfoNYELnlpOaMN2FC6SClgBJUaQcwr1ChM20mkgoBCV20W3imBuiua9CNJD2Vw1Ba9yj+
 ka19yKcUTtnIUpqkZyZXlFe0zJTKpJxc/JuNjQebJnv92ef/nZJXKar6rvAYgPaaBissf
 uYgdvURQoWU+t1ZgroZ1ooSzBsgVrEU5yRxW+o4DS870i3z0Y7mU9coEANF1Pxfg9mGCo
 38y9+Qh6yjsTTLz/B5z5JMWMzGnhg4S6d4RYfORhSUUGCnwiyUY9OnUB8RjdNR7T0yA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jHmZeLW1; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jHmZeLW1
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BD374060A
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:52:31 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-6faddda49e7so2953605eaf.3
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 14:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793051550; x=1793656350; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LGi/45bKRP+yA2RyJrdJye4AlfbgQ6mr4ESGylppsQI=;
 b=jHmZeLW1d6FXk6chuSxqu3wSvBoQ6Lqr7es3mQrLDcnAyVPFHnHTa5ElPz8SwUG24p
 U9oTcyT+0mtivf3aTcxlHe3i3WXtPRQ5T9V1sInm3fI4MVLbwoskM/nIi9yAYB0LivkD
 JwmWZvG33XeRUAFdCAyNEXX2BLLHLsUNuW+kT3lM8JG2XtkaDBueb4t2GFwbbaUPd4aA
 TqRAgs3S+d9iWb1rnpWsJSskIOt98bi1h/EbLNjcMs7XKpv7fwEZ+w36kSI004QWpGK3
 nGz98JGWT51rfmLTh9/I8ZiLYhkAsS2ut2WdJnxk2eEUHMMNXVqkqLGWiqN3Nr1x9iA+
 Gufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793051550; x=1793656350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LGi/45bKRP+yA2RyJrdJye4AlfbgQ6mr4ESGylppsQI=;
 b=XJafraLhB2eI3KWI4wH3JbOtJu+4rFnsqVeCTctQfLeg4wFoSqUdP5bLxTXg+YfW85
 74MCt4mLgwNid+wx8D3UnwWgvFSJS441ECbC+7SX41q3yWUFw6lrNorA15nFq6xAwzBi
 SoNDnHAgtBMx3NX9hBep7vryqYug2kvzliqXv8DPwqp83b+5lZsM9KjG4hinjS/r3ymU
 F+dXVtAFqiDev5z4D98z+FAEqv1hhdmtYu9M8GOP+8p7qUqrCQQRoTjCmRS+WWmR92ky
 IHLK1Ha5vuxzCdoRs9gCmk9xSypgPBiLEdrhy/9OckrXiPUeTrw63qz3dInH2Cj5qYmZ
 PwsQ==
X-Gm-Message-State: AFq9FYKQbpEatLc8hByJDxcraYpImEXZemJT9zw1yG7pBSJzRjHDhLBD
 Ew9OX+nY8UVXjUgqV08AsBzpQIiJUuT3EESYpuP85nYtXgahnbs+jv7Ji7lblOGn
X-Gm-Gg: AYBFou1CdpdqtgZAgTl0HhA+QweMXzBzntB2qrtn6LTlAqX3nOcQHDDbujb0H0t+Cji
 Exi+cwou7XtCr04o6b/mlRapk2zAVkulKycb014n+D4HaxN2CqxMFRYVBFa3NNb2y72RIFaJB5g
 TjcvDuNxzPwceblLg0QzUq3BryR6gzRjLGPzZN1aMDJ5RHoCM33y4wbQvw8y7FzsL7uiKTVGSrY
 gC9eDDKZ7deYvqMx2ws5yVEa6Q7GqfDqPF2RdbrZjbVBS+Z+MaSkxW63oNwx94D8sk/zxEXH83k
 1AozxgDyidKi+jYOXce8nBIzVx3cOU8XkHsPdx2PK1HpxWmxU0NdLQdmzz9VpyI2YfOFhn5QwYj
 +VLFlUB03OV1TTnq+f9YrxHy8y0MZjSx3e2xzyuI+78LNlF85SazaI5ogFRs4k/oJbH86QQ8mnF
 vEGDgJ/x5OGvyTWPqBTZ4fHcK2WiCWLNWH3laBLXLTBwsT02ENd/I5adheaGIJ6iRoT2BMWQs+7
 rX2R3TYhChBujCvgqC1zrze68pzDiYtZSsyKqsqB+GOkvo5zVW7FYfQypQ31/PWCpmWIIeN5n1q
 +YKqa0hqqof49ZoyQMseJixLzzdIHVXQrjv2jDhnVgI2uvaLIinSH/sOs8wBomGFjDW0AZh04wI
 wYAKHkHNUrgjDaoHEQqhNYJ4xDwDMyfmatR8E5EasuBJM9i2HQukvcPSbqgopLaroFZehLMPf4H
 YD6O4GbCA6GnM3AR6iio/++iCm
X-Received: by 2002:a05:6820:1c96:b0:6f5:1e7f:c65c with SMTP id
 006d021491bc7-70ba0e6d4c3mr4402211eaf.33.1793051550471; 
 Mon, 26 Oct 2026 14:52:30 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9e2cd81bsm7593182eaf.14.2026.10.26.14.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 14:52:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 15:52:27 -0600
Message-ID: <20261026215227.3243353-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cloudflared: bump to version
 2026.10.4
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cloudflared/cloudflared.hash | 2 +-
 package/cloudflared/cloudflared.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
index b963d57aec..b9c397c5f8 100644
--- a/package/cloudflared/cloudflared.hash
+++ b/package/cloudflared/cloudflared.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8e1f95a4e4b11cf545dccafbc49c1b251b3b4625b1986ab8384203d6738c9cc5  cloudflared-2026.10.2-go2.tar.gz
+sha256  a6767773edf7123540d74dc02a04d7411b696066f6d23ea94131541dea532743  cloudflared-2026.10.4-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
index 5003515ab4..7436b0a211 100644
--- a/package/cloudflared/cloudflared.mk
+++ b/package/cloudflared/cloudflared.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLOUDFLARED_VERSION = 2026.10.2
+CLOUDFLARED_VERSION = 2026.10.4
 CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
 CLOUDFLARED_LICENSE = Apache-2.0
 CLOUDFLARED_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
