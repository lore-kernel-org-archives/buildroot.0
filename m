Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B23C606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 08:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Walayc2A;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=nbbhaV1D
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE0B8407E4;
	Tue, 20 Oct 2026 08:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCSvOLBDs3MD; Tue, 20 Oct 2026 08:16:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E1C93407E5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792484164;
	b=Xn3BX3OHiZx6QN8O8DCbqdGnjJxhv4/vij04R0XhH0fzVJ609pe6wl4W2C4jyCVIEmWt
	 i/ZV32gmhbJpaWYLsev/TkIH18t3JM4o0DYI+8zrFzhsjMNiqBXyHUm+3fHrRl1fQr4cQ
	 DM3BBfSfQjGPnRxnsiXqxR/bmJqGywyJH33H4eHlP2GLtlme3d8LCLk8aoySWID5Wi36p
	 VWHVeHYRJHfJYhc8nJOMChaTk3z4JQMs3T/ZsUowVLLH+FsYfqIRT4cs0JrLXmB6EmwlJ
	 WXtatxec+cGnRjljATdV2N2Ivu3Yltr0jmHEaRlfaiZwwMHRD8AQr9hmLU0iMY7vzOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792484164;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=o2e9WdOfP1/Kg8Q121MZoUPAXRTh4WpIgAaJS30S78k=;
	b=lsx0GlVYsDerW6zSUYdZ7yBjuKa8USGa42t47bEpxezr0TyFlzkIc5pr7QNkrAIVT+mT
	 RqkFpg1huRg5IOCEqg486aT0ogzDMnUbOhfqpuvKh4g0Z6378d8nsjbOOLSVTsYXvmHKE
	 EZCEq32HxkURkNnBzyjmRU6oMaDIK2ruRVExQFZqYwYH7EzLpGkfWW3eVzmcrCyjFRezC
	 cV/ZmR0XO4Mx6+QP3mYJ+QS0mkos2TyR5ootjAeuN/MD1kYC+5q6EriKey2eRtSv0Hj49
	 GsnYn3PM82dBL1un4eWdyn+msg2BglgYohoqbvSmAOjIvUbJuLutu7HH9PcGc9Q/R8Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792484164;
	bh=o2e9WdOfP1/Kg8Q121MZoUPAXRTh4WpIgAaJS30S78k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Walayc2A/QJwtacwcQgGLX2ycn6FcGXdQhjx0kHA5oI/8XvKaHmiVBHm+1jXnbIef
	 q9FVLYAgQP+e0uRoBU5MDbySL8OIDhDo2a9Q5qI6udP/GCpb9wKBmArjXTe62uBQO3
	 TOnIa3PousmIAlZX85XR0Ki2izg9qIhyefjpVLTO6FjvrtUZ1ISeu3AIthHYokXkQf
	 wjTdb3IclLsyct+pN/uUk8phOAG5x8psOFAzu5oLLI3LSWpsC4oPDIhbQUGH8c/uKf
	 BMWMOrFndH34KB7psaFdDcXb2jxmYk69OYjXw9OUkKYDP6JRmoirDxRHo4UChu6B8K
	 9rxwdiOAqqPOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1C93407E5;
	Tue, 20 Oct 2026 08:16:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 302991DE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DF4360822
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6QwxZ3MGiUH for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 08:16:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0C770607BE
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792484161;
 b=pYAHyxqJTNoW34Or/q5LFNTtNSgnRdvdDWE9jaxmsn88z5veLdGihzhJFJhDtAVV4ce8
 T8+ULihFw0VvmCkcO6YCSzdrIYhXYiqQ+ZZp/rBWOjPGLHTk45y/LoSfAzOiGgQdLZoCe
 XybsFhX1ZeXyIgjLR+3sRsg4B00ma5tC3PkZFcdiP3C5dZ2iMj1IBJkVU5sDvEGNjCJlG
 7Du6+vKIlef1ZuckHGEXK7wbI3gB/7R40CE3cVaFnPJLj7FpHgILrqz36KdrFASupv7pv
 i3execMYOnx7bS8/OQES4ny+rPjF0IqGJJXy31Cxm+1M3sWxFTljuqXjLoo4ftM5yGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792484161;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=XnPh39UgQjFOj3EEnrWZZgTTScH5zhrCl/l8yomD0k0=;
 b=XPlXSaKDBIo7l5lILxMTvJxJhEwjpCmDKf7KQE/cobnDXmKA7PeOBWRjTrBvK7dDRsDv
 efhNxkr5trBReZ5Vjz5nArpAr9PBxibLVd+21xQnyS/T5inAZOFCrVAWqi4fsAhL7agfw
 GEFXEdOJApcbNGywyGoXzjKRQyFuz6EPcGirtmK8iH81CBtLPUrNDVbnyWQZEn3UpSpq4
 njs1yCdzNRO8FtMqJXmWuwIyK3hcCZC9aCygkD23rag77gbg9WoWAcIw8LXh0xlYvuYFh
 GZmpL4LpUhSzKLLUY4KBJ6LwtqMAi0XxoJZB+P1FWJs/Do3stk08zrnEFMRo824Phng==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=nbbhaV1D; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=nbbhaV1D
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C770607BE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 08:16:00 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c414e5d282eso339171166b.1
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 01:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792484158; x=1793088958; darn=buildroot.org; 
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=XnPh39UgQjFOj3EEnrWZZgTTScH5zhrCl/l8yomD0k0=;
 b=nbbhaV1DT7lI+9skf7YuQ46LeJPs7CVJD37f/+v68eFtTpJRqSZNfymFIGbz4BHSpP
 P23pcG07XJDg8MhrbRH2TuFDUxmjHaXDMJJf8xJnZydAAnXL4K6uszz0pJQYjHW1cxl2
 g3lSLgL0cbiSmW17LVmooVn9FRvTeZTMrxap6kHhGW69eXX8HDualwq3Hb0mi5cYfja4
 quDr5H14sGAhI0lN+B8Ue2F7BDGOeszzj60NqMuGCFa3A3WE5HUqsWWi2azuyffoubZB
 hccACPxF4A6fcoQ+z9q0MzDqx00izg1DultZNsr5og3CmmzLtxrF5UEnEsM4+eFxXr5j
 +i9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792484158; x=1793088958;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=XnPh39UgQjFOj3EEnrWZZgTTScH5zhrCl/l8yomD0k0=;
 b=yBK8xOhMIGNZBrLfimqsxCZQS5hRB4wzHY7o4I/XP82YfSiUeirCKtt7c8l1nMn3nJ
 IpsyVObCQnZnxDMeRrA799gNIKFZ5ZQQxokOkZYn1KKv3ejMbvTjG1UOqhj1n+WHcs9m
 /E3PX0zrbcZ/w9vIsMujY4TExMpTpPpPGyng9PTVhCc2Vl6f1kx7qv4M28xtklmxfnvo
 90/tz8HBkmVTNRAGpVjOl3aGV1HaQv+pMmpyFLcQipccHvcJdSN8Eon7bzeSaMBSAeWq
 up/of6ERphMsyae1COxoNhPpY085GXCUnjPOrzLSeuq+mYGTacqGqdn7W2htWYkPJPsh
 tDyw==
X-Gm-Message-State: AFq9FYJ4gjZ55TXcutB0GSF8x9XEGII2ZDtdi4UdyZCNvymuG8M3DMdX
 nguepTtNpDgD1vaSWnYs9CEzo1mXSCSzLaahFz//k38cT88i0UpJlYOkAetMjQ==
X-Gm-Gg: AYBFou2EEVwk7VMGjdNAQ2VEfCvGBO3EMFPuCDxY/lteQQ0sO/dwVk8jt+Kvw1T9kUR
 ABczMFTibhrqSOyMfXJxhfNvHSdYJ62MKw+okuO9P3Ms6ZX2QTkiFbaaKNkKUC8eWI1Wro1+VEk
 M9A8adJc43waBnrLSuqunIw8j+bf2c5fdQYokVmzmCX9G2TtQhYpy6M1k4b9z7tYM8ltdHATjOu
 xqvTmb2djg/hkHYZvT5Pzs+lAFFSh7g2yyqKUW/2pu0e/Byafp24SzGp9lcuamE+VFen7tyxQNZ
 e/gT1O8cxI7PVKwjuK3Q57F8itExmGRm8Vua7rhTl7sVwmARTN3Ug22bTuWRivtoFjHX9c5WjfT
 xsC2Dl9E9FIcyiHkO4CvgvS7H8EVxuUsIp/2UriVtVYTB2FNW94jhwZT3s6BQuGFU4v7OXb/Ieh
 AFlXTjvUrngRMf+7kG9pYlk3bMWkG3wijehgAcEvuMNdWaxQxbCNz7XX1z0ePL5WuwWnqyZdwmV
 KR3jK+f6kV1aStnExgYOKpsBbscuzByxZacyB290r7MfjwGKWJB1g==
X-Received: by 2002:a17:907:c28:b0:c43:6fd8:91b with SMTP id
 a640c23a62f3a-c436fd811c5mr458610366b.43.1792484158258; 
 Tue, 20 Oct 2026 01:15:58 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c40919c0f2asm461608466b.62.2026.10.20.01.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 01:15:57 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 10:15:57 +0200
Message-Id: <20261020081557.2965981-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/iperf3: fix build with LibreSSL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

aXBlcmYzIDMuMjIgYWRkZWQgYSBuZXcgImdvdG8gZXJycmV0dXJuIiB0byBkZWNyeXB0X3JzYV9t
ZXNzYWdlKCksIG9uCmEgY29kZSBwYXRoIHRoYXQgaXMgY29tbW9uIHRvIGFsbCBPcGVuU1NMIHZl
cnNpb25zLCBidXQgdGhlCmVycnJldHVybiBsYWJlbCBpcyBvbmx5IGRlZmluZWQgd2hlbiBPUEVO
U1NMX1ZFUlNJT05fTUFKT1IgPj0gMy4KTGlicmVTU0wgZG9lcyBub3QgZGVmaW5lIE9QRU5TU0xf
VkVSU0lPTl9NQUpPUiwgc28gdGhlIGJ1aWxkIGZhaWxzCndpdGg6CgppcGVyZl9hdXRoLmM6IElu
IGZ1bmN0aW9uICdkZWNyeXB0X3JzYV9tZXNzYWdlJzoKaXBlcmZfYXV0aC5jOjM0Mzo5OiBlcnJv
cjogbGFiZWwgJ2VycnJldHVybicgdXNlZCBidXQgbm90IGRlZmluZWQKICAzNDMgfCAgICAgICAg
IGdvdG8gZXJycmV0dXJuOyAgIC8qIG9yOiByZXR1cm4gMDsg4oCUIG5ldmVyIHJlYWQgbW9yZSB0
aGFuIG91dHB1dF9idWZmZXJfbGVuIGJ5dGVzICovCiAgICAgIHwgICAgICAgICBefn5+CgpCYWNr
cG9ydCB0aGUgdXBzdHJlYW0gY29tbWl0IHRoYXQgZGVmaW5lcyB0aGUgbGFiZWwgdW5jb25kaXRp
b25hbGx5LgoKVGhpcyBpc3N1ZSBoYXMgYmVlbiBwcmVzZW50IHNpbmNlIGNvbW1pdCBjYjEyOWE2
NDFiNDAgKCJwYWNrYWdlL2lwZXJmMzoKc2VjdXJpdHkgYnVtcCB2ZXJzaW9uIHRvIDMuMjIiKSwg
YXMgdGhlIGJyb2tlbiBjb2RlIGZpcnN0IGFwcGVhcmVkIGluCmlwZXJmIDMuMjIuIFRoYXQgY29t
bWl0IGlzIG5vdCBwYXJ0IG9mIGFueSByZWxlYXNlIG5vciBvZiBhbnkKbWFpbnRlbmFuY2UgYnJh
bmNoIHlldCwgc28gb25seSBtYXN0ZXIgaXMgYWZmZWN0ZWQsIGJ1dCB0aGlzIGZpeApzaG91bGQg
Z28gYWxvbmcgd2l0aCB0aGUgMy4yMiBidW1wIGlmIGl0IGdldHMgYmFja3BvcnRlZC4KCkZpeGVz
OgpodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNmVkOGY2MGY1NmY3ZmNk
MTFlYWExYmExNjA4MzcyNzViODExM2UxYQoKRml4ZXM6IGNiMTI5YTY0MWI0MDNjZmM0YzFiMmVh
OTI4MGI5NjZlMTk4MzdiNjIgKCJwYWNrYWdlL2lwZXJmMzogc2VjdXJpdHkgYnVtcCB2ZXJzaW9u
IHRvIDMuMjIiKQpBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTUtNQpTaWduZWQtb2Zm
LWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Ci0tLQogLi4u
cGVuU1NMLXZlcnNpb24tY2hlY2staW4taXBlcmZfYXV0aC5jLnBhdGNoIHwgMjkgKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2lwZXJmMy8wMDAxLVJlbW92ZS1PcGVuU1NMLXZlcnNpb24tY2hlY2st
aW4taXBlcmZfYXV0aC5jLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9pcGVyZjMvMDAwMS1S
ZW1vdmUtT3BlblNTTC12ZXJzaW9uLWNoZWNrLWluLWlwZXJmX2F1dGguYy5wYXRjaCBiL3BhY2th
Z2UvaXBlcmYzLzAwMDEtUmVtb3ZlLU9wZW5TU0wtdmVyc2lvbi1jaGVjay1pbi1pcGVyZl9hdXRo
LmMucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNDViNTgxZTVh
NwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvaXBlcmYzLzAwMDEtUmVtb3ZlLU9wZW5TU0wt
dmVyc2lvbi1jaGVjay1pbi1pcGVyZl9hdXRoLmMucGF0Y2gKQEAgLTAsMCArMSwyOSBAQAorRnJv
bSA5NjIwOGYyZTQxM2Q3ZmRkYzE5ZTY4ODhiZTVmYmQyYWNkYjA0NjA2IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbTogUGV0ZXIgRyA8NTU3ODYwMDArV2F0Y2hlck9mVGhlU2tpZXNAdXNl
cnMubm9yZXBseS5naXRodWIuY29tPgorRGF0ZTogV2VkLCAzMCBTZXAgMjAyNiAxMjoyNzo0MyAr
MDEwMAorU3ViamVjdDogW1BBVENIXSBSZW1vdmUgT3BlblNTTCB2ZXJzaW9uIGNoZWNrIGluIGlw
ZXJmX2F1dGguYworCitSZW1vdmVkIGNvbmRpdGlvbmFsIGNvbXBpbGF0aW9uIGZvciBPcGVuU1NM
IHZlcnNpb24gY2hlY2suCisKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vZXNuZXQvaXBl
cmYvY29tbWl0Lzk2MjA4ZjJlNDEzZDdmZGRjMTllNjg4OGJlNWZiZDJhY2RiMDQ2MDYKK1NpZ25l
ZC1vZmYtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KKy0t
LQorIHNyYy9pcGVyZl9hdXRoLmMgfCAyIC0tCisgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25z
KC0pCisKK2RpZmYgLS1naXQgYS9zcmMvaXBlcmZfYXV0aC5jIGIvc3JjL2lwZXJmX2F1dGguYwor
aW5kZXggNTFkMWExYjZlLi5jZjBiZDc0NDkgMTAwNjQ0CistLS0gYS9zcmMvaXBlcmZfYXV0aC5j
CisrKysgYi9zcmMvaXBlcmZfYXV0aC5jCitAQCAtMzgwLDExICszODAsOSBAQCBpbnQgZGVjcnlw
dF9yc2FfbWVzc2FnZShjb25zdCB1bnNpZ25lZCBjaGFyICplbmNyeXB0ZWR0ZXh0LCBjb25zdCBp
bnQgZW5jcnlwdGVkdAorIAorICAgICByZXR1cm4gcGxhaW50ZXh0X2xlbjsKKyAKKy0jaWYgT1BF
TlNTTF9WRVJTSU9OX01BSk9SID49IDMKKyAgIGVycnJldHVybjoKKyAgICAgZnByaW50ZihzdGRl
cnIsICIlc1xuIiwgRVJSX2Vycm9yX3N0cmluZyhFUlJfZ2V0X2Vycm9yKCksIE5VTEwpKTsKKyAg
ICAgcmV0dXJuIDA7CistI2VuZGlmCisgfQorIAorIGludCBlbmNvZGVfYXV0aF9zZXR0aW5nKGNv
bnN0IGNoYXIgKnVzZXJuYW1lLCBjb25zdCBjaGFyICpwYXNzd29yZCwgRVZQX1BLRVkgKnB1Ymxp
Y19rZXksIGNoYXIgKiphdXRodG9rZW4sIGludCB1c2VfcGtjczFfcGFkZGluZyl7Ci0tIAoyLjM0
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
