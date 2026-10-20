Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2011A606A334
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 06:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i0C7i58e
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FC3C6081A;
	Tue, 20 Oct 2026 06:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0RJ9WDdhddx; Tue, 20 Oct 2026 06:44:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7994160802
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792478657;
	b=ZNCb8VF1SCIAb3KYDIU6Wz6ioSwqlikOglcFC+xmr5ekHPvghintAywavz1tCYwlQjze
	 AGpyNEv5TsO9fGSMBXiHdSoMbXHLjI08VhWFf4t+nLRue7xjqTl+sfu/L8jnzDPNKtpdC
	 a2PH5/Qwn9RMfhDLyxnEMr3izVIvW2rW9lbZADFC3+K+eKqy2Nxa7mPbNlZAgHIzh3esX
	 wvXGgU1mQjFYR0XuNMLb6q0I85jCMCiMu+wm6PWtIUIajhIVCbl7Wq23HnAygqu76SNnY
	 niEsdTxlBdNuLqBEXTl1+KgQ3PSybABBL70zmehp+eIFz1CqSzQyOrOSRBT7iHbY84w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792478657;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zi4qaBtvk9oUqiixyiMDXp86w2fGcOI+wPHULowYIEM=;
	b=IGM0iPcVCdFmCBMTMuP2Da7TiYgimsZNQwIS3iPUaGNKrUJ7VXhPuojZer+qvI6j/lvz
	 8urlvkbtvlXYoUl4bmBQGLNHi0MBhgXwylKOR7QSAvNpbscv04ISpiWN4Qp//1LoyU5Gq
	 WCHt9wp8z/fKmGaJ5wZgn9qg0Za7bbnCbmTHj/be66FLTOOhzePKhTRfxSXbtPB/PdVhe
	 CBsvyu9oh52BAEhdQPjKNBEXkOZMoeIMo59XD9HT8+FxNGJPtj08KhhfoBWL8pLpB2yEQ
	 p9GhoyZRwfGK/bgr2OPr/SutXK48vQSffKgxIGBdYkG2XuSKhYWEgaWt6ADRHEGot5w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792478657;
	bh=zi4qaBtvk9oUqiixyiMDXp86w2fGcOI+wPHULowYIEM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=i0C7i58e/FpqwHTYoQIvRfF0Lb5C7b9GqHSngKYOvFSEO4ue47KRWWcUv+nH3j+sl
	 beQqNKWugoWn0EZSsPl8rBeEpsTuiAUWYuEFtWV65a3KwRONQrxvA4Ga63aGG6DDue
	 txiaMm83lSIf2ElDmEGx3GeYaxfnwxE7FdTWcYj89VtHoGcjnyChaMbbPKdc4gjbHL
	 QHu7oRFW/Lp/Y8Ppk9SGY2tvPHXa5fk4Dg3sDup46g7nmiBBWe2Hyy3o8JZCn7dbYX
	 8WMVCcMAAZ0wcI1VpIFDmyheZSjNOGE0p32dZmryDFyi/qLCQMrHQS+P6RXt54nN6B
	 Wjd+oR6/k0UZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7994160802;
	Tue, 20 Oct 2026 06:44:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E3E13A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 06:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6000F607ED
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 06:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qe_5Jgm_98CK for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 06:44:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1DD36607BE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792478654;
 b=jX8LknGbsgQDYrj/vDOi00lpJpCK+0lYXiwPZQlRgO5BuQqLmg43DESsr5oZ1ElH3nV1
 ZpfV8BxihfBNs2FNQZlxFvVDq7T3y8/kmoPpftxdykGkUmnychMiCHaRgMv1URejqyeU+
 8xKcSyVC8rrO9TsqWAXtirR4tmRV7DJJhSpvQwvMTgWOr4IvYAVoAf6y/P09Z5kvzZQ5u
 fIIB5zFME1SwSNz/ZOwR4Ulu6WpGmHMjhpMN5UBXnP+YEVEOH998dTVuAF1t2Njlui5lX
 RkFgwdXU0uVwxHXgs2I5szRyNptBFFJDuq5PjCpk7nbmpT4cvWeWa+Hy4pTPW8vPQgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792478654;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=8uVt7115Msns5h98Z9WUQ2R7Kc2pevlBuKxHSKkdkrU=;
 b=RIMFbYzeFZ+B8G8oMJNZ3WgS4v6Bamv63y8d/qNHT0/RIC8DiMTFN0WcQETV9do4zbRY
 FS98SMuk6CCMTTFwL1sCIyXvvXah2XVnh5Mt9pmhkvMK7hnQ85Wl+d494bIk5qwF+1cZ1
 WwnG84JW742MPs9vdErUrSW99Dbs6BIIRVm8Z7uRqFL84Ul3GBGSd9n9/qdMrGTC/eFv9
 jvHQwfT8cYNKhLNZ0HMJKzDKENGKqUHSlHOs0EPYOvwX852QXRKC/NcAT5Btftu89JrQN
 t2LD/Nrb7iBOluUb/bko1M2uaSsQ9gWVFvp7tWUVl0Nbd5rTMkyQmCcwl8pWsHy3vfA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=b5AiDWi7; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DD36607BE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 06:44:13 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48e0d1da913so285715f8f.1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 23:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792478651; x=1793083451;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8uVt7115Msns5h98Z9WUQ2R7Kc2pevlBuKxHSKkdkrU=;
 b=0YNBg2pEDNe7utIeRvbxFFcK90x4CJXz8h2iZHTVTOF7s/caVDZoWNT4F32+WDiu/z
 AbhcXvM9MUKjlnp08fOSuKS121WnVKYPMg63mnad6bOm5Ory/cj84L1peG1dcY9FNbu1
 U8ZQSFAVACntePT/ZYr/yhfYBRjp64RUu/eHa1rBdfHf5H9lDclikFcVY9zkIJgTqCZP
 RQk+tZclKd7nyqJwsbgoWBVc3arzWmp1YBVEzXeTfSz8O3qBt9wy3outjuqpfZN6q8R9
 hVcJFCH3cxhz6hzj1ZYpfR6Sg68AQ8nftVpjklIA4eg3V/902g9Baw0sZm4Dj2JqxiAk
 KlfQ==
X-Gm-Message-State: AFq9FYISFR9X6vrQFs6PUeZSG17GVw4lT142aHmjQ8Nye9utYfqgQN0y
 r/OoeASuPHgv7O9amwfFNGsGyd5sTlKsead+e1vXNeWgAXjdpyHdQx5qPx0Q4zpaEjUdc1twwMe
 drgMA
X-Gm-Gg: AYBFou2HKGj9v4dxMxK9L2W0n0MryapKZOGLLoO7+IhMn/7NsNXXqk5wNnh2X2PT9U8
 af3a6secMhOrJLC93JcWfhWFUCLFl63FAb7a6serFAxslCifYtp0XiioKp+0cpm7J/PGqT2bBoY
 B6ctfmRwoIW3afWzKcnHl3qq0jAc1PMOJrH/lXy0EodBPtCeGkBZ/u8s/fXU8fk9JjgzJOfBbKl
 f2lU7jJF5xz9qbFe1iPbWu0SVkVg4jTrLEFGGatjJS2EV0Lz6o0GCwciHytS5M2RWbmJ2OSmWiQ
 9uEWZ9BwzkgtdnTR+bpn2TB2wahH35OM29nrox2O9HEUC3H6m41ddSIp1gJOtwRr7hJRJ3EzMLw
 6GwvFQLkgUZhR30+xlvQpuYAsCgMorLF9wF/0k18Jz93gwhlsxmTn8MCU2HeZ7pVA2CDC1vQXq2
 Ezgak2hWBDWqmwHkzbU9dGKI+WiSqQdxjeOWeVFL0K3DB+aFY6TdN0mVQf6ZT346o=
X-Received: by 2002:a05:6000:2481:b0:48c:7d67:8ee9 with SMTP id
 ffacd0b85a97d-48e1e76edaemr3260844f8f.19.1792478651628; 
 Mon, 19 Oct 2026 23:44:11 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d823cfcsm4013632f8f.39.2026.10.19.23.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 23:44:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 08:44:08 +0200
Message-ID: <20261020064409.179420-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020064409.179420-1-thomas.perale@mind.be>
References: <20261020064409.179420-1-thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 2/3] package/python-scipy: fix build
 with GCC14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

V2hlbiBidWlsZGluZyBweXRob24tc2NpcHkgcGFja2FnZSB3aXRoIHRhcmdldCBHQ0MxNCB0aGUg
Zm9sbG93aW5nIGVycm9yCndvdWxkIG9jY3VyZToKCi4uL3NjaXB5L2ludGVycG9sYXRlL3NyYy9f
Zml0cGFja21vZHVsZS5jOiBJbiBmdW5jdGlvbiDigJhmaXRwYWNrX2Jpc3BlduKAmToKLi4vc2Np
cHkvaW50ZXJwb2xhdGUvc3JjL19maXRwYWNrbW9kdWxlLmM6MjU1OjEwOiBlcnJvcjogYXNzaWdu
bWVudCB0byDigJhucHlfaW50MzIgKuKAmSB7YWthIOKAmGxvbmcgaW50ICrigJl9IGZyb20gaW5j
b21wYXRpYmxlIHBvaW50ZXIgdHlwZSDigJhpbnQgKuKAmSBbLVdpbmNvbXBhdGlibGUtcG9pbnRl
ci10eXBlc10KMjU1IHwgICAgIGl3cmsgPSAoaW50ICopKHdyayArIGx3cmspOwogICAgfCAgICAg
ICAgICBeCgpUaGlzIGhhcyBiZWVuIGZpeGVkIHVwc3RyZWFtIHdpdGggdGhlIHBhdGNoIFsxXSBp
bnRyb2R1Y2VkIGluIHNjaXB5CnZlcnNpb24gJzEuMTMuMCcuIEZvciBtb3JlIGluZm9ybWF0aW9u
IHNlZSBbMl0uCgpCYWNrcG9ydCB0aGlzIHBhdGNoIGludG8gdGhlIGN1cnJlbnQgMjAyNS4wMi54
IHNjaXB5IHZlcnNpb24uCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3NjaXB5L3NjaXB5L2NvbW1p
dC9mZGYzYjkwOGVlYjkzMjAzYzE4NDdjNmZiNGVmZDEyZTg4YzM3Y2U1ClsyXSBodHRwczovL2dp
dGh1Yi5jb20vc2NpcHkvc2NpcHkvcHVsbC8yMDEzNQoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBl
cmFsZSA8dGhvbWFzLnBlcmFsZUBtaW5kLmJlPgotLS0KIC4uLmUtRl9JTlQtYXMtaW50LXJhdGhl
ci10aGFuLW5weV9pbnQzMi5wYXRjaCB8IDUwICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRo
b24tc2NpcHkvMDAwMy1pbnRlcnBvbGF0ZS1kZWZpbmUtRl9JTlQtYXMtaW50LXJhdGhlci10aGFu
LW5weV9pbnQzMi5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNjaXB5LzAwMDMt
aW50ZXJwb2xhdGUtZGVmaW5lLUZfSU5ULWFzLWludC1yYXRoZXItdGhhbi1ucHlfaW50MzIucGF0
Y2ggYi9wYWNrYWdlL3B5dGhvbi1zY2lweS8wMDAzLWludGVycG9sYXRlLWRlZmluZS1GX0lOVC1h
cy1pbnQtcmF0aGVyLXRoYW4tbnB5X2ludDMyLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLmY3MjJjNGNhMzcKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5
dGhvbi1zY2lweS8wMDAzLWludGVycG9sYXRlLWRlZmluZS1GX0lOVC1hcy1pbnQtcmF0aGVyLXRo
YW4tbnB5X2ludDMyLnBhdGNoCkBAIC0wLDAgKzEsNTAgQEAKK0Zyb20gNTM3OTY3NzJlZDczNWMx
NTY0ODYzZmM3Y2E4ZDkwMmFjYjYyODE2NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206
IFJhbGYgR29tbWVycyA8cmFsZi5nb21tZXJzQGdtYWlsLmNvbT4KK0RhdGU6IFRodSwgMjIgRmVi
IDIwMjQgMDk6MTA6NDYgKzAxMDAKK1N1YmplY3Q6IFtQQVRDSF0gTUFJTlQ6IGludGVycG9sYXRl
OiBkZWZpbmUgYEZfSU5UYCBhcyBgaW50YCByYXRoZXIgdGhhbgorIGBucHlfaW50MzJgCisKK1Ro
aXMgZml4ZXMgYW4gaW5jb21wYXRpYmxlIHBvaW50ZXIgaXNzdWUgdGhhdCBzaG93cyB1cCBhcyBh
IHdhcm5pbmcgaW4KK1dpbmRvd3MgQ0kgam9icywgYW5kIGlzIHJlcG9ydGVkIHRvIGJyZWFrIHRo
ZSBidWlsZCB3aXRoIEdDQyAxNCBvbgorRmVkb3JhIDQwIGluIGdoLTE5OTkzLgorCitVc2luZyBg
I2RlZmluZSBGX0lOVCBpbnRgIGlzIGRvbmUgaW4gc2V2ZXJhbCBvdGhlciBzdWJtb2R1bGVzOyB0
aGlzCit3YXMgdGhlIG9ubHkgaW5zdGFuY2Ugb2YgdXNpbmcgYG5weV9pbnQzMmAuCisKK0Nsb3Nl
cyBnaC0xOTk5MworCitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3NjaXB5L3NjaXB5L2Nv
bW1pdC9mZGYzYjkwOGVlYjkzMjAzYzE4NDdjNmZiNGVmZDEyZTg4YzM3Y2U1CitTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+CistLS0KKyBzY2lweS9p
bnRlcnBvbGF0ZS9zcmMvX2ZpdHBhY2ttb2R1bGUuYyB8IDQgKystLQorIHNjaXB5L2ludGVycG9s
YXRlL3NyYy9maXRwYWNrLnB5ZiAgICAgIHwgMiArLQorIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvc2NpcHkvaW50ZXJwb2xh
dGUvc3JjL19maXRwYWNrbW9kdWxlLmMgYi9zY2lweS9pbnRlcnBvbGF0ZS9zcmMvX2ZpdHBhY2tt
b2R1bGUuYworaW5kZXggMGU5MTNkMWM3ZTQzLi5kYzc5YjJiMjg4MzMgMTAwNjQ0CistLS0gYS9z
Y2lweS9pbnRlcnBvbGF0ZS9zcmMvX2ZpdHBhY2ttb2R1bGUuYworKysrIGIvc2NpcHkvaW50ZXJw
b2xhdGUvc3JjL19maXRwYWNrbW9kdWxlLmMKK0BAIC0yOCw4ICsyOCw4IEBAIHN0YXRpYyBQeU9i
amVjdCAqZml0cGFja19lcnJvcjsKKyAKKyAjZWxzZQorIAorLSNkZWZpbmUgRl9JTlQgbnB5X2lu
dDMyCistI2RlZmluZSBGX0lOVF9OUFkgTlBZX0lOVDMyCisrI2RlZmluZSBGX0lOVCBpbnQKKysj
ZGVmaW5lIEZfSU5UX05QWSBOUFlfSU5UCisgI2RlZmluZSBGX0lOVF9NQVggTlBZX01BWF9JTlQz
MgorICNpZiBOUFlfQklUU09GX1NIT1JUID09IDMyCisgI2RlZmluZSBGX0lOVF9QWUZNVCAgICJo
IgorZGlmZiAtLWdpdCBhL3NjaXB5L2ludGVycG9sYXRlL3NyYy9maXRwYWNrLnB5ZiBiL3NjaXB5
L2ludGVycG9sYXRlL3NyYy9maXRwYWNrLnB5ZgoraW5kZXggMDhjYjBjMTQxYzk4Li5hOTUzNWE4
M2Y0NzkgMTAwNjQ0CistLS0gYS9zY2lweS9pbnRlcnBvbGF0ZS9zcmMvZml0cGFjay5weWYKKysr
KyBiL3NjaXB5L2ludGVycG9sYXRlL3NyYy9maXRwYWNrLnB5ZgorQEAgLTE2LDcgKzE2LDcgQEAg
cHl0aG9uIG1vZHVsZSBkZml0cGFjayAhIGluCisgI2lmZGVmIEhBVkVfSUxQNjQKKyB0eXBlZGVm
IG5weV9pbnQ2NCBGX0lOVDsKKyAjZWxzZQorLXR5cGVkZWYgbnB5X2ludDMyIEZfSU5UOworK3R5
cGVkZWYgaW50IEZfSU5UOworICNlbmRpZgorIAorIHN0YXRpYyBkb3VibGUgZG1heChkb3VibGUq
IHNlcSwgRl9JTlQgbGVuKSB7Ci0tIAoyLjU2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
