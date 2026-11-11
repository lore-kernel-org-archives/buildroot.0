Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4650A606A31C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 13:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CPaM8cLR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=LuK+Q9sr
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E17760793;
	Wed, 11 Nov 2026 13:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNvVrMFFYNEy; Wed, 11 Nov 2026 13:19:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 42E6860796
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794403173;
	b=riFaJiacLaZc2B3GwCSfUTyRGuxhlBdrwb21+9TZSlWf5L4oxA6d1UXzFM81yUNucrOb
	 tQdD6SV24snuWuYDtiFWMt+bZ9lTxfTQzNdTz8TxO0siEB4U6J2T/i3rANcqH6O8p1TCQ
	 o7/J3S+TCkWvUHzzu9Bqi2xAAkDez6feukD30r9huqWXDIyL4frCVAwDNBovYb+MvygQe
	 KV6in5pDeSDKhlcB6SHePR5275c3G8xoT1qAfua0mMe6bIhq6XmoNxQQETtY1fnJVNeIR
	 RVzmfp6OnCgZiNQ9H8gLmBWUUlB1BGm9fRdYdu9ScTHXtbShArWS4iPCv2YbNXBa3OA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794403173;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EAv+qAbRs0k2QVKsaiTNbAZRBTthC4ifw2ejZ/azgSA=;
	b=lRSKw6vIH9mmkKSYx2OKPHOpduaLPEjGbBvaBg30qhMl4EqOKfqEWdJjzLe0C6XFsPm5
	 UPZZezaGVdMTL7WF7JR2ddfupr/lRUXUjoifj+krLmN1VDY2YJdWl81SXjFz8l/0oiwEG
	 B/lsBPxa3/IftDL8zxjBStTeqp6L45tgDY64CqVgwd8zh0U7P806AVu+kwiqM+vJIRYDs
	 +YUwgrUYFnJpjmsbOBuRiK94n/QQlrlZKjhkMwSCEgKPaY746mnN6ET4pE9obmQPN1GUM
	 m6r1oXW0eT1dcGqF0iySKgTOKUkBQUPLaqh3mEkw+hAVo85h0eeqzNU3ffEnM7ntt0Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=LuK+Q9sr;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794403173;
	bh=EAv+qAbRs0k2QVKsaiTNbAZRBTthC4ifw2ejZ/azgSA=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CPaM8cLRuO5dGlGDWR1KtLvlrvEuSVABHH+gL4UVCCIubbD62ch5Bwmlw2VuSPPIp
	 5CF0v80iXoiYgfWw69Bghp9nJ2BZbujfXstZJIN63pc7BVntRpqj9lMcJTkQ6zYUUx
	 gbC0oUV20ZTUg6nWENrsgdr4OwaDODmdHl4tnJlnmJ3Akk58rnyQNXsCIlFXPcEkjB
	 0XW507k5lnZrCVz3+F+xr4qZnJBgMHPCpfE93B2Hu9vP/le2uVQbeqhUhcEIzZsWXe
	 hLwQdlzRZGcIuGyfDIarLtRgzqqkVexufqWCP/lYThvSorSSzaB0JMZpC4X10eW9Vn
	 NkbtMPjkho7Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42E6860796;
	Wed, 11 Nov 2026 13:19:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A2DB131F
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 13:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD5B260796
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 13:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8AKU0DtyVdKf for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 13:18:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D723060793
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:20::62e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=LuK+Q9sr
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D723060793
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 13:18:39 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c4cac7a7d3cso446307666b.3
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 05:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794403117; x=1795007917; darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Mpj7vDNZYrplUOc4c4Timz5xFcPzuR9dSgvEqX0+ORg=;
 b=LuK+Q9srOQwGg403kuHLCIq9lZoxbm/vNeh16BbyCSyKhhSlrItpmXNEnZrm709g4c
 lzMfN62ofiViJSWCTTVafLoD9PrNxpzUtNQ54BBXl9mbC1Y+yXUx7CbqhJlwPpXNt7zH
 U5abNbTAcw1fVwO5MNLjXiAPMJAJGdqFZ7RW0YSfgSJ1strDIyX6I5OKu6PdcGKCeHi4
 fP0wGamRPmWDUZ3q7C5ci9faTbn9AzzyUjBrt4aRd5h6HamyVQVNfSlQBEPy6K2NBCav
 WoOnHFh8XIN85sn5p4O0UwN0SFS7i12P3SYuXh+uI0sJ5N7wIDppc1gT3CCk0z7HD8Rs
 4C4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794403117; x=1795007917;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Mpj7vDNZYrplUOc4c4Timz5xFcPzuR9dSgvEqX0+ORg=;
 b=IYE6Hd547qP6Ewi8IO37x+nOsmqmqGfL4M5/v8nl4VXUiJ2s1rR9uulzGGuN+p8Lh5
 p47wXuzWwFU/8cspULi2AB4DLmXu8YlkR6y14b9l4OyVvqDuJ0THpY99R+mpAMyO/pAC
 4Dg54sJqAdzyGQX0LLOjK5b5WnC0t6Q09mdv6Qo4JBwDmq81yQJ0SXjlV0nic/2Qv+E+
 tPDa0Kg4VfPr3wI/sLPL+nT69z3U3Q/9/uClWcpuMPppWTVzC0IKg8+nAPHWwNQnw0sf
 PAYson+zLKEvB/MCKComNaH3L9aVS99/BNieK1XiQpkZwZI/lrxAK07RnM0laZLG9JKF
 O8xg==
X-Forwarded-Encrypted: i=1;
 AL+hErF+in4H6x8jko7BC2PaHhF3e/x2JoMXRb1DgFEstIyL+Pt0xzYFMUT1lvQNKR/oj1ug+OcgD3Yju7Y=@buildroot.org
X-Gm-Message-State: APuU4Z85z5iYYAHQ2zjto8bEQauauJjQjFgKeqR4EUbRuBzJv40a7Qd0
 pDbJTfyF0iCbG8f1Bcb3ZbkYZ9dERPZ8m7WBkB9GzOEhZKARUCvE6tg3PXqQPa9Onm9pjvQBMtB
 nKodK0Ng2+iqP0IxhRlZwyMv1cp0xfNk=
X-Gm-Gg: AYBFou38JM5qDQCa5lT2rV7rhJfQlpMrfmYlGgmFcOdMXytK2mWnul+I9/bvK147BDk
 dTehqHbGZHhpD1jlRMnTR1maP7U63AZ+w7PXJQt9Mqim9HchDVQkkTliTo1iZeVHYWQDLwUJRsX
 kneKM50bqcbTIzuE5ueAsMv92mtqzfUasNZR3TiU1x+M/IVoCZWhyqnJ2oSLMARHdPDvkBqz8O7
 e8SklCjv3Q34XmuQ3EvY0Jru1jZjktQi3SActC+0NeoEmZ1qhwYVmdnvSFmEq8Obo2QLmg19MBL
 JLhWr0WfV/MUyY7yjqbbaCZ9nDLDOwS4vewaCck9h33l5TtsfBc4xo5ERgML66mCXlFOU7BFjMn
 TB/YubOQhR/a6WjwHARusg1Y+4yglRCQekkhQyA==
X-Received: by 2002:a17:907:6e94:b0:c40:80eb:c54e with SMTP id
 a640c23a62f3a-c5066869b39mr189936866b.4.1794403116948; Wed, 11 Nov 2026
 05:18:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111081946.3850218-1-yegorslists@googlemail.com>
 <878q2zmxq9.fsf@dell.be.48ers.dk>
 <CAGm1_ks5cqsnUXwepApaQ0C=s3b1u8rqu-Xiv2mStVAKWj6KHg@mail.gmail.com>
 <875wy3k2d0.fsf@dell.be.48ers.dk>
In-Reply-To: <875wy3k2d0.fsf@dell.be.48ers.dk>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 11 Nov 2026 14:19:00 +0100
X-Gm-Features: AclHuK-mpvdp3tseTKismXU3jTBj5Y1SJFun-DFOaJkiqd7lRPvsqh0Z3ZJ2VpA
Message-ID: <CAGm1_ksex3BDW5E3WEnSRjTH07kC-f=1oZgJmZZ3DKUNDzUKqQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/am335x-pru-package: fix host build
 with GCC 15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTEsIDIwMjYgYXQgMTI6NTfigK9QTSBQZXRlciBLb3JzZ2FhcmQgPHBldGVy
QGtvcnNnYWFyZC5jb20+IHdyb3RlOgo+Cj4gPj4+Pj4gIlllZ29yIiA9PSBZZWdvciBZZWZyZW1v
diA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+IHdyaXRlczoKPgo+IEhpLAo+Cj4gID4+IENv
bW1pdHRlZCwgdGhhbmtzLgo+Cj4gID4gVGhhbmtzLiBTaG91bGQgd2Uga2VlcCB0aGlzIHBhY2th
Z2UgYXQgYWxsPyBUaGUgbGFzdCBjb21taXQgd2FzIGluCj4gID4gMjAxOC4gSXQgbG9va3MgYWJh
bmRvbmVkLgo+Cj4gRWhoLCBubyBpZGVhLiBJJ3ZlIGFkZGVkIEZyYW5rLCB3aG8gaXMgbGlzdGVk
IGluIERFVkVMT1BFUlMgZm9yIGl0LiBXaGF0Cj4gZG8gcGVvcGxlIHVzZSB0byBwcm9ncmFtIHRo
ZSBQUlVzIG5vd2FkYXlzPwoKQUZBSUssIHRoZXJlIGFyZSB0aGUgZm9sbG93aW5nIHBvc3NpYmls
aXRpZXM6CgoxLiBUSSBDIENvbXBpbGVyIChjbHBydSkKMi4gcGFzbSAoQXNzZW1ibGVyKQozLiBH
Q0MgUFJVIFBvcnQ6CgpZZWdvcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
