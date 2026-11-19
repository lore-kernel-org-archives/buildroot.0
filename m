Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ACE606A33A
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 09:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Nh071RAS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtU3lfd0
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60F7C60B58;
	Thu, 19 Nov 2026 09:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBGZtDTQoeBl; Thu, 19 Nov 2026 09:56:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7B28D60AE2
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795082196;
	b=LU9q1VNx4w+FVu5FPLNs1HzP5sXpGh7kWNW/vO5DXBuJI9yKTJXJ/u1OThjFwpiUBaEL
	 Fn0IXfejjRkjvau5CFI3AxOJPJ82Vz2QQK6CzvTp1E7v4D9QlcdceeQgFFExG8ApHblzV
	 uDP5uDuVZxCk6C6V3k7FMqvZkT5kRIaPoMRmz+hno8wW2BglMKsi59t6CjQXBspePSy+5
	 rRMKPzJtL0aYlaC0GAu0U4WLJbbm0juo2EawLsxe33/1VHJ0fwKFclqBxWcTVQxhCpY2V
	 gFczi2cksjWs6iAVf3kEn2cMwKlKkQhhdE8zd9XrJPc/RuaXu42IdZgHKRzAhkBQmyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795082196;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=yv1Jy334I8VKmeFiQjRhxFnTDby3t+YToL9vdFObL8g=;
	b=Qx6HCnSSpM9Q4vsSUDy55vl957ZQYKekVzsHAomQUZQ5X3vp8wOjyPQ3NE+7+HftvnO4
	 QrdKFpXLytA/JuTCRyF5rLBoYjin0A7iYwt/T6bXaObdX0YlT3RUfmTRS+gh/v6Uslej/
	 sHy9KMJ8d/+wxwmPsPU2ph0uKJZnzpwsqykCwpsQ3x9wl/HUQC5rh2jO0Yg7m3LYWa/M3
	 G84g4dB78iySztZwjlSJ9HE5Honcxxpv1hSpzeT7YCFdzm5k3m1cY9dUP2BOnb5NsU5QO
	 gkBCnPq8VCoTjZ5BP+6E7Rex5Quaw0ZhCPN9+RezeQp0fLq99l7VPVlAu7Ms/cxpSFQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795082196;
	bh=yv1Jy334I8VKmeFiQjRhxFnTDby3t+YToL9vdFObL8g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Nh071RASxPlP0eeZ14MoacSCS+s84MTZ3qCBfP6x6i170c8C8X+DSTjRQoFQtqaBK
	 DtTSCbdKilRzlOkJLi5+pk0P/JsNbv+kKcZtRs8GdNYhvrMKPRydgQm6+U5R3pqBXn
	 3hywrFp05dcCvXwHtK0iZgpB+f8F4UIcaa0NpSes0G1mx4TsoXhmO0fOBFp/v919W+
	 ZGAjj1g9yDTSwQdsoBBK6MbnnhjDNSAho0SDQAVBUvOPqfv6z6nrZ9gn+JzRXpTpB+
	 sqpwB5Tcb5xw+RvRewsvxVFhQKxtD9Wc84X8usMEnuI6JsZNnIiPihZJfTNiaXUw/W
	 7MUBbx5FChdHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B28D60AE2;
	Thu, 19 Nov 2026 09:56:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80A4F70B
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65EFD81244
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuouFaRMUcXr for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 09:56:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6221481135
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::431"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=jtU3lfd0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6221481135
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-498f5fa5103so1163479f8f.2
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 01:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795082192; x=1795686992; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QwbAOuorNT2vIp8D7Ymm6f2OSS2LRy4wsdcQU2lO4NA=;
 b=jtU3lfd0oxolpclzTEWv/yl0mwXhklTbVLO5tXGFVhKRbe0MngZwNwmv16wONarDbb
 ulWHcCYD1qeek/aFCRLtM5bMZ0EWZuTaPB58Br5L0Kgr3TQ4NijKlkJvpsNjtIAhZ3Sy
 3i5FVs35zqUFo+AYJwSiRsoLobVlmHlz7f3CkRZhZH6Xk68Ywpj45iA2xa7HegT2i9ED
 UVYHX9SqAxky3f45we9OXY/vPGfsi/KIuwBfmoe0GnKXwOonY7q63WZ6g3hLieRt7Jny
 6gT5/52P2j8swkceUZNOB/xcFIbugIRQO0/NZbXlzlqYM0fzaVlcxd78GiuurpSWKLC+
 lyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795082192; x=1795686992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QwbAOuorNT2vIp8D7Ymm6f2OSS2LRy4wsdcQU2lO4NA=;
 b=tiJHKu27rS37lNjCu7DpehfAGTUEmRUPUyKcODIVYtVg0Hr6wnZakhS3hD2U+AhzBR
 mbvfznbwYQ9vIxxnX5hBbPHS5c24Mw75UPNCOREzJWOLtbaJF2TFM1Duvr2QJe63mEbr
 8j6uG3JL9kwYK/4Dyj6121KSutsiapyo5p4fOfluh9u3H7VJhVvm8kMeuiX419Y6Wtb+
 Xf0ZSyDb2kkYed+Twrv4moIN9Ka9jO2KS0akhMQJ3d97JtamzQh6ism+SdSEeHwdFHF7
 BsXw5pJrHxa1TL14YiqV70vkPD93BTHgqHtnEYoAVavW2r6gT09zpqlmngZCIoDtbq2N
 WJqw==
X-Gm-Message-State: APuU4Z/trNZIDuUaId97JVgOQw+u1N2oJMIHou0RqTBxMaazxItovLGi
 0L47usU7BV40WklRFsOYMIXtme89iwrGZy8i01yvLq/7ZO95TGGWUd62SZwFNw==
X-Gm-Gg: AZFdTZcC77/EyHNOZPJnMi3MVC0Y6zE1PfpvmnbC8yBPqZAqCXrQNTBEBwqMZHhn/E6
 cnzjw7MNkQoz78Ncnq0guCCkctvCbARz78tMvcZXXGTk7ebSxMx21z8NWAm2Gjy0JiV9J3goYrn
 kx6kTWdJfQzf3lnqbJ9aFWoxxbKXJTWIh9SUhkHBpSyzFFSz+QwGjlGfBfN+kzHKwIZT/urV+oS
 DVdjQfPmILkbV/KrcnxL44/1h9WNjh9HqLOiZR8PxpWvcZLHU55883OcFo21YibOBVusr/qpK5F
 P75U31VsJEa7iOG0c1rDyPg8zsQzdZuQap07mNSAg63aY+m7GrW1uf68C5ZiSyP5e978tqJVx4K
 ucSe4Kq2I5MC3RPD5BqEyvxo3OxsrMBQOkknNcvTS8ElDKet1LTTqBwBRndwtoBE7ZJQlP+e9jX
 SUtFGs7R3KXtXTSR8XgNq/N8tVmLU7Fmmde4xJIKyeUjLwjq7YoahMyAUIkxqrwNeiE3Yu99wdL
 lCbrosjA1a1cD4DhigG/xM6vPjO9QJKEdt+Nt+mnvSJDHCxaGDjzlZQsVP0+zH/dDTkrN8239hJ
 HVk1VHyTnCWdKFhH1BqL2MDm0lgEIcbKXHHcd53eeNsGp3zhJvItfOM+Xi5wYuiCg9JxkCjiAc8
 m91mOW0uO5F80snwbvNcIuDG3CaDiZHnsINHbS1Vn2vfzAtKVxKOdE3mw5QsBJA==
X-Received: by 2002:a05:6000:258a:b0:48c:5304:5e50 with SMTP id
 ffacd0b85a97d-4a62d6d7305mr11623432f8f.0.1795082191399; 
 Thu, 19 Nov 2026 01:56:31 -0800 (PST)
Received: from angelo-Precision-7550.fritz.box
 (host-94-86-174-214.business.telecomitalia.it. [94.86.174.214])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a65560bd46sm9439635f8f.31.2026.11.19.01.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 01:56:30 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Nov 2026 10:56:24 +0100
Message-ID: <20261119095629.1990220-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031143617.445438-1-angelo.compagnucci@gmail.com>
References: <20261031143617.445438-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/6] package/python-web2py: keep the admin
 password at boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

S51web2py starts web2py with -a '"<recycle>"'. The single quotes keep
the double quotes, so web2py gets "<recycle>" with the quotes, and not
the <recycle> keyword, which keeps the current password. web2py then
takes "<recycle>" as the new admin password, and overwrites the one set
at build time by BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD.

Drop the double quotes. The systemd unit is right: it passes
-a '<recycle>', and systemd removes the single quotes.

The bug is there since the package was added, in commit 7c0fab65aa
("package/python-web2py: new package").

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - new patch: the new runtime test found this bug

 package/python-web2py/S51web2py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-web2py/S51web2py b/package/python-web2py/S51web2py
index 8d229e16cf..11fe912afb 100644
--- a/package/python-web2py/S51web2py
+++ b/package/python-web2py/S51web2py
@@ -6,7 +6,7 @@ case "$1" in
 		start-stop-daemon -S -q -m -p /run/web2py.pid \
 			-c www-data \
 			-b -x /var/www/web2py/web2py.py \
-			-- --nogui -a '"<recycle>"' -i 0.0.0.0 -p 8000
+			-- --nogui -a '<recycle>' -i 0.0.0.0 -p 8000
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
