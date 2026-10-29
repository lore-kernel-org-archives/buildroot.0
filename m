Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12133606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cO/l/k9n
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCC4381066;
	Thu, 29 Oct 2026 21:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbLewNJYAAaN; Thu, 29 Oct 2026 21:50:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D64EC80BF3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793310625;
	b=FMi4+sJ96kbHZrpPwnQw5F6HSXnD69BBWC7/UIpVyd8XyOecGl3XuqBi2tS/i/pfwNOk
	 QY48qn7wgZUcLcJizta/MICPlORfL4tdHlQUWyINDLhX4E0V11cQdrPAjgdzggFzLZu6C
	 Yc6obUl0jVErD30K8AbItX9JFay6gwPjI7PNr7F3FCwQEhslUg5UV4/srOSrTi+5Lt5sd
	 aE1hRJP82kEZ8+qbpmWY1bWWYyvr9zbJhBQwefLPHFj+O19S20l5U//C/0SFHZCM9l6/L
	 ccBK1GwPqJ8P5vp5h5ztjXy3LoUuPxeLxqe2e8AJcRuoVG+wwRGfEulLi5nAtGcPDYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793310625;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Jp1U2smakO1zgMw4bT5wRvEKOLCIx/tK9J2dApQXFD0=;
	b=pCyFROQggi/riwOpJqcdP2cmO1mDQS1AIYe4bI7UMelhjNCFGwDxccq7lN3I++n+eZpE
	 ozW9bfvy7AlNNL/uBW4r9tW/KGhi5YC6SQoq/hrsjJ9y64wxeEvCUe0l/plcTKbfe6eft
	 l35kvcy4Q0RROzEiChCS81CZcneC38PSBqlXtBbHIizvIpOs/qgltIYSoDkgbF24vz7iX
	 3f2SqBEbQdM+VB1pDJNv8ZNFrHsNbZGxTqJOM1CwBxTPDqY9Kx3pDYV3kHkUdy6l5sTPP
	 OpzkDdGe4aSvFK7mrPwNJ6EJXeGrkKjrBJYusHcJLVZmPky0Atszlut6lFwXHTQqDVw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793310625;
	bh=Jp1U2smakO1zgMw4bT5wRvEKOLCIx/tK9J2dApQXFD0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cO/l/k9n0aBtMHGyp/+ACcuQXx73I4xBdUVIbEERjnJVTliqFfudRHEn71/SrvnOT
	 G+Mlzk1qwHBvqhWi83bzCT7v/GyORrN6oMt2m0/c8+4dg8BgqrWqJilZLU8ABS4ue0
	 FNG1bEIZl1L1Nh0qqaxLLfwiUras2wa6evfeu7J/HmzFfq4Olw3o4dxXExW4/KN/ZC
	 6SDxxtPLItQ3AUR+zsR0PvducZ7rORwgTCaZHMZPFse3msEADVo+OFzysaARPVGAYD
	 V7B+YDtftCOLrOv1JMsAhVtCCRKjRtgn3uzjaRZCkaVe8a8/Ou/JP0xPxffs4k6vib
	 w+1LVAW2o2PHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D64EC80BF3;
	Thu, 29 Oct 2026 21:50:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E8481DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FC7560A79
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHz3ZnTyL_yP for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:50:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3DB8160602
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793310620;
 b=WPPzJdb7gg4G0A5F0g0oOWqr4MXJI0zWkQOV14So3cyfFWTHdUouGCwgsOpquEkrISB2
 OQHG5QJ1ipbtb873dwwmHpuluWLqaGa2Obh/2a9/NssTnJza7IHrhQTKQsvFRuKiGgyyy
 DKq3ljKH6+nvV0B/cI469zdyx6dCNIYfno3RLolomg/36AKqBoRv6nlLhZWCbqgiqFRoJ
 5VK6rRxwj8Te4i+ijKT4UXUMAfTW8zk5RYhtqIH0t4/4esV+hLoddNR2TIHDr2IHUBw3n
 SOvVKcZ3GPYrqSyn+a+AtCNI1yBaqMPpoJnsUjKK7XNo1HzXBo8lSdn36Fv0djzUEIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793310620;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=hP9tutX9jAWaJSZMM6j725dkcxwfLKrYovyyzuQthcg=;
 b=CM8z9oF6Ke/8quf0KFsh86Jgd7T+OEP7s8wCQAU5n1DYMaE4ZhzEwUaXfS5/YfWwS5YB
 lt33AMcz25CYZlXJDFk54w1/iusHjSE2jQKsWieAY+ZnDyztaDogj1Q1zxQo+sn16d+9H
 qrXN3OR8AfsVZAJxIvnutqWnyGNic07kpitsdYVOz3umcebu68UpCByIIG7ltggbv5xji
 cz57TDHUnkqBREN/lSRtdhse3VlF7kqo/QVNaXFXUM6awZr5QVSbsb0URywZMJSWYq21w
 +nr1SSjh6cjmke0JXH3u3U8picZjTFsEs4b5nl3EuNkSAceftoPFjTP2HuNlAFNaUmA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=C7A0ViB3; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DB8160602
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:50:16 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a208d93758so275005e9.3
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793310615; x=1793915415;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hP9tutX9jAWaJSZMM6j725dkcxwfLKrYovyyzuQthcg=;
 b=t8WQNUhuxxkuZRtOq9yKFEWyKBwxk7SrhEMpmNPzsGfS1Rl2s44II5GZ1EFiLM5xZ0
 zEb31UmCavK/8+rKETI4fKYUdZBcZYVGVD+Yx/F4tQG5xzAWQI+oQVAq/TMsj2ytZrYe
 pHQnCGbO+SG0EMepgdCYGkkeGygvYysNnA8dfdFsNPL98bg2G1LB5JYm6chOtng0JpFa
 sO5Ka8tUYZ37RKAvl+0GNwWNZGDbbW+tNAKOfJIDq4fXOwZfJMUeYmBykq9wVoi+hrXu
 LOe4TXX9qKNVn51suODQ+Whv//DZAUImvTDObfbOYDK6ge3rnbNee2NIjhY9KR+79QLR
 9Z6g==
X-Gm-Message-State: AFq9FYLaU4s89mLVdMKEkCUqF8Sy0R6j1/VEOjiGilMy2obe79VwPwlO
 wjFkX9eLkfjgD+FQEJC19AHLGQ13axo9u2JmB3EmLz9Z5qOqr96UNFjX429XBvp5MJ0Xkr7LTT0
 lHpsiKMf7PQ==
X-Gm-Gg: AYBFou2Qe3cg1DyqDvRI9Cjb52nruYuVEQuQ6Z3H24cc6gTLrOA0IAJpg/TIpWijbBy
 Mx/+enRB7h+evR7i+uloRZ6W+LCHgnxpfYNto3r7dikqadRh/K+lwuBoBBOGmjZErkrtfs9TIAb
 LPQarcG5iCicnNOhNHj999f3JJE0UggUPPDYu5qFr1z2PNsvs9EvuCXcYcIoPzlBGy0im3zRb3/
 mQ3Z36KuAZx4Ti0ewkw2GohN++PS6o1IanXLGb0+w52izSTVldBSlkju4pNHQUKr0lHRPk8dYO0
 NXiKzC8mX+BCHcw7/vHlGJXo9MGYG/sSop0LgL6Bi3/uYqmYfU6h67Kuzb7NciFxETKA6ChW730
 qp6J+i8ZnAKuM8usmZWqxhw0RQWJMzFYthzQo5sa1dT02S4PRn5qaf7fLOZsp5LaaQPwGnxdosW
 YAoct/hycYsEEa61hAzH9Zibi3JJfGDSjyF81MorkPx3gnXIsxCXH/u9QXL1CNqmKH6Wumulhf1
 ZlBkjiKrzp7BFZ/SKoAzSz6b5/wV7Qps5sPDlExnoz1EvhEJpfpdW3bKh8la/Vww0Wfh6lsM0+0
 c5maWjXU9UQ+pLZ/AeR2IV5FQjjPg2WxfQ6SrjsIGQ7J
X-Received: by 2002:a05:600c:19d2:b0:4a6:4d6b:a840 with SMTP id
 5b1f17b1804b1-4ac1932a12fmr5237725e9.31.1793310614814; 
 Thu, 29 Oct 2026 14:50:14 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf396dfdbsm14406245e9.1.2026.10.29.14.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 14:50:14 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu, 29 Oct 2026 22:50:01 +0100
Message-ID: <20261029215007.1788801-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029215007.1788801-1-raphael.melotte@mind.be>
References: <20261029213546.1783883-3-raphael.melotte@mind.be>
 <20261029215007.1788801-1-raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for, 2025.02.x,
 2026.08.x 2/4] package/mupdf: add upstream security fix for
 CVE-2025-71382
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIC4uLi1mb3ItdmFsdWUtZnJvbS1pbmhlcml0YWJsZS1wcm9wZXJ0eS5wYXRjaCB8IDQy
ICsrKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvbXVwZGYvbXVwZGYubWsgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAzICsrCiAyIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL211cGRmLzAwMDMtYnVnLTcwODg0MC11c2UtaXRlcmF0
aW9uLWZvci12YWx1ZS1mcm9tLWluaGVyaXRhYmxlLXByb3BlcnR5LnBhdGNoCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9tdXBkZi8wMDAzLWJ1Zy03MDg4NDAtdXNlLWl0ZXJhdGlvbi1mb3ItdmFsdWUt
ZnJvbS1pbmhlcml0YWJsZS1wcm9wZXJ0eS5wYXRjaCBiL3BhY2thZ2UvbXVwZGYvMDAwMy1idWct
NzA4ODQwLXVzZS1pdGVyYXRpb24tZm9yLXZhbHVlLWZyb20taW5oZXJpdGFibGUtcHJvcGVydHku
cGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZDYzZmRiODIwOQot
LS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbXVwZGYvMDAwMy1idWctNzA4ODQwLXVzZS1pdGVy
YXRpb24tZm9yLXZhbHVlLWZyb20taW5oZXJpdGFibGUtcHJvcGVydHkucGF0Y2gKQEAgLTAsMCAr
MSw0MiBAQAorRnJvbSBiMmYyOTM5ZDQwM2ViYTZkNWRkYmE0MGUzOTgxZjNiYWEwNmYwNzk2IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogVG9yIEFuZGVyc3NvbiA8dG9yLmFuZGVyc3Nv
bkBhcnRpZmV4LmNvbT4KK0RhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMTY6MzI6MDUgKzAyMDAKK1N1
YmplY3Q6IFtQQVRDSF0gQnVnIDcwODg0MDogVXNlIGl0ZXJhdGlvbiBmb3IKKyB2YWx1ZV9mcm9t
X2luaGVyaXRhYmxlX3Byb3BlcnR5LgorCitBdm9pZCBuZWVkbGVzcyByZWN1cnNpb24uCisKKyhj
aGVycnkgcGlja2VkIGZyb20gY29tbWl0IDcwYjcxYWIyMmU2ZGU0ZDRjNDRjZDMwMWM4ODIzMWY2
MjNhNGU5NGUpCitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL0FydGlmZXhTb2Z0d2FyZS9t
dXBkZi9jb21taXQvNzBiNzFhYjIyZTZkZTRkNGM0NGNkMzAxYzg4MjMxZjYyM2E0ZTk0ZQorQ1ZF
OiBDVkUtMjAyNS03MTM4MgorU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhh
ZWwubWVsb3R0ZUBtaW5kLmJlPgorLS0tCisgc291cmNlL2h0bWwvY3NzLWFwcGx5LmMgfCAxMyAr
KysrKystLS0tLS0tCisgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKKworZGlmZiAtLWdpdCBhL3NvdXJjZS9odG1sL2Nzcy1hcHBseS5jIGIvc291cmNlL2h0
bWwvY3NzLWFwcGx5LmMKK2luZGV4IDA3MDM4M2IwZi4uNjVmODZiNDcwIDEwMDY0NAorLS0tIGEv
c291cmNlL2h0bWwvY3NzLWFwcGx5LmMKKysrKyBiL3NvdXJjZS9odG1sL2Nzcy1hcHBseS5jCitA
QCAtNzkyLDE1ICs3OTIsMTQgQEAgaXNfaW5oZXJpdGFibGVfcHJvcGVydHkoaW50IG5hbWUpCisg
c3RhdGljIGZ6X2Nzc192YWx1ZSAqCisgdmFsdWVfZnJvbV9pbmhlcml0YWJsZV9wcm9wZXJ0eShm
el9jc3NfbWF0Y2ggKm1hdGNoLCBpbnQgbmFtZSkKKyB7CistCWZ6X2Nzc192YWx1ZSAqdmFsdWUg
PSBtYXRjaC0+dmFsdWVbbmFtZV07CistCWlmIChtYXRjaC0+dXApCisrCXdoaWxlIChtYXRjaCkK
KyAJeworLQkJaWYgKHZhbHVlICYmICFzdHJjbXAodmFsdWUtPmRhdGEsICJpbmhlcml0IikpCist
CQkJcmV0dXJuIHZhbHVlX2Zyb21faW5oZXJpdGFibGVfcHJvcGVydHkobWF0Y2gtPnVwLCBuYW1l
KTsKKy0JCWlmICghdmFsdWUpCistCQkJcmV0dXJuIHZhbHVlX2Zyb21faW5oZXJpdGFibGVfcHJv
cGVydHkobWF0Y2gtPnVwLCBuYW1lKTsKKysJCWZ6X2Nzc192YWx1ZSAqdmFsdWUgPSBtYXRjaC0+
dmFsdWVbbmFtZV07CisrCQlpZiAodmFsdWUgJiYgc3RyY21wKHZhbHVlLT5kYXRhLCAiaW5oZXJp
dCIpICE9IDApCisrCQkJcmV0dXJuIHZhbHVlOworKwkJbWF0Y2ggPSBtYXRjaC0+dXA7CisgCX0K
Ky0JcmV0dXJuIHZhbHVlOworKwlyZXR1cm4gTlVMTDsKKyB9CisgCisgc3RhdGljIGZ6X2Nzc192
YWx1ZSAqCmRpZmYgLS1naXQgYS9wYWNrYWdlL211cGRmL211cGRmLm1rIGIvcGFja2FnZS9tdXBk
Zi9tdXBkZi5tawppbmRleCBmNzgwZGEyZWI1Li43NmU1ZGI5ZjZkIDEwMDY0NAotLS0gYS9wYWNr
YWdlL211cGRmL211cGRmLm1rCisrKyBiL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsKQEAgLTMzLDYg
KzMzLDkgQEAgTVVQREZfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjYtMjU1NTYKICMgMDAwMi1idWct
NzA4NTIxLWF2b2lkLXJlY3Vyc2l2ZS1jeWNsZS13aGlsZS1zdHJpcHBpbmctb3V0bGluZXMucGF0
Y2gKIE1VUERGX0lHTk9SRV9DVkVTICs9IENWRS0yMDI1LTQ2MjA2CiAKKyMgMDAwMy1idWctNzA4
ODQwLXVzZS1pdGVyYXRpb24tZm9yLXZhbHVlLWZyb20taW5oZXJpdGFibGUtcHJvcGVydHkucGF0
Y2gKK01VUERGX0lHTk9SRV9DVkVTICs9IENWRS0yMDI1LTcxMzgyCisKICMgbXVwZGYgZG9lc24n
dCB1c2UgQ0ZMQUdTIGFuZCBMSUJTIGJ1dCBYQ0ZMQUdTIGFuZCBYTElCUyBpbnN0ZWFkLgogIyB3
aXRoIFVTRV9TWVNURU1fTElCUyBpdCB3aWxsIHRyeSB0byB1c2Ugc3lzdGVtIGxpYnJhcmllcyBp
bnN0ZWFkIG9mIHRoZSBidW5kbGVkIG9uZXMuCiBNVVBERl9NQUtFX0VOViA9ICQoVEFSR0VUX01B
S0VfRU5WKSAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgXAotLSAKMi41NC4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
