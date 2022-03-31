Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CE1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 20:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0066941117;
	Thu, 31 Mar 2022 20:04:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qifJRpjJo8hH; Thu, 31 Mar 2022 20:04:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0324B40ACC;
	Thu, 31 Mar 2022 20:04:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C15911BF354
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 20:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC2D660F05
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 20:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l9JJR3EzLnof for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 20:04:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F4E260B75
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 20:04:08 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 p26-20020a05600c1d9a00b0038ccbff1951so2419727wms.1
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 13:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=80iqmgiqnA7e7FAPUyaW3V1cZNxmHbUnVwQOeTRl+QM=;
 b=ctQh+KKI03t5uHKxXrUHkrDbkvEKSv3LIkTlWC7bRIRhqcBzzPOqpZMJV2/xaQymwy
 yTOxBtCn2n/pV1fQwdng2O4oTiBN/vm6jcpNjcsf9bN9FaW8PRNfQxb0QbiH8iSsqCjO
 4T662kJCDC+BrEQea8qFNt/a2UGFg+N21pYftZgALQmJqzES7WujDOg/KL7YrAK1ss9X
 td4XHIJh/uUFj4i5qHZoqONN9HmpNrOcgHbEft++iQh7pTUbmYlSEQYxEVydWiy8VLdf
 696dTQvdTfW4Ka4hbSosUPBVkZEofOF/9rlT32RW47KNihuyQnK/QkP84epig96xaV0z
 nXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=80iqmgiqnA7e7FAPUyaW3V1cZNxmHbUnVwQOeTRl+QM=;
 b=haAeeH+ep1Fcz7H19+H8peO3HmWS+x749JwBl5CGYQl5lakPTrBIFFAtipZ8DcaGOu
 KnAA1vCf0U4/OSEx2hIHRbAfMDPmSYHQyqo7N2heiwV3vb0B0GDyHDYwIHuQi8IEFlMn
 fp7nQtVVxJXArHKwf2LUIUGx+eEDrBj9uKHuZWbJqCv5sqi0zuUTZJet1aQLiieKvWsJ
 HQ8QpROUbbsdEukbfzbbWhumfgL8tpAWuv0T0KSo0erXzrjmhjfUIaYMwYiiQymex+aZ
 1l+xIyxLNPP/OUdxWmDf9H3CiIqm9jLFwKUzrEfzPv2cSP79Oi4nz3Wathw/opxA/Hum
 BfTg==
X-Gm-Message-State: AOAM533Ggn5jeJnwm9jvppYD2rqdO8b5Rie0tEZuDbJaMrrFRWskolQS
 UY+8tFwXVLIUhY1MQMYYY9I=
X-Google-Smtp-Source: ABdhPJwNidkx5fI78td0SnbQLTuhL4rAW5twuFGL8IMcsYLRMknWRv9Tg+gvfDEl0mXJxkTW/Ra45w==
X-Received: by 2002:a05:600c:4f82:b0:38c:9185:1ecd with SMTP id
 n2-20020a05600c4f8200b0038c91851ecdmr5944270wmq.130.1648757046562; 
 Thu, 31 Mar 2022 13:04:06 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 14-20020adf828e000000b00205b0fc825csm318732wrc.65.2022.03.31.13.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 13:04:06 -0700 (PDT)
Message-ID: <397c22c3-8ca6-2300-a049-b8f6fa716699@gmail.com>
Date: Thu, 31 Mar 2022 22:04:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220313114741.1127825-1-fontaine.fabrice@gmail.com>
 <87mthbb08q.fsf@dell.be.48ers.dk>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <87mthbb08q.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-twisted: security bump
 to version 22.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSAyNy8wMy8yMDIyIMOgIDIyOjM3LCBQZXRlciBLb3JzZ2FhcmQgYSDD
qWNyaXTCoDoKPj4+Pj4+ICJGYWJyaWNlIiA9PSBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5m
YWJyaWNlQGdtYWlsLmNvbT4gd3JpdGVzOgo+IAo+ICA+IEZpeCBDVkUtMjAyMi0yMTcxNjogVHdp
c3RlZCBpcyBhbiBldmVudC1iYXNlZCBmcmFtZXdvcmsgZm9yIGludGVybmV0Cj4gID4gYXBwbGlj
YXRpb25zLCBzdXBwb3J0aW5nIFB5dGhvbiAzLjYrLiBQcmlvciB0byAyMi4yLjAsIFR3aXN0ZWQg
U1NICj4gID4gY2xpZW50IGFuZCBzZXJ2ZXIgaW1wbGVtZW50IGlzIGFibGUgdG8gYWNjZXB0IGFu
IGluZmluaXRlIGFtb3VudCBvZiBkYXRhCj4gID4gZm9yIHRoZSBwZWVyJ3MgU1NIIHZlcnNpb24g
aWRlbnRpZmllci4gVGhpcyBlbmRzIHVwIHdpdGggYSBidWZmZXIgdXNpbmcKPiAgPiBhbGwgdGhl
IGF2YWlsYWJsZSBtZW1vcnkuIFRoZSBhdHRhY2ggaXMgYSBzaW1wbGUgYXMgYG5jIC1ydiBsb2Nh
bGhvc3QgMjIKPiAgPiA8IC9kZXYvemVyb2AuIEEgcGF0Y2ggaXMgYXZhaWxhYmxlIGluIHZlcnNp
b24gMjIuMi4wLiBUaGVyZSBhcmUKPiAgPiBjdXJyZW50bHkgbm8ga25vd24gd29ya2Fyb3VuZHMu
Cj4gCj4gID4gaHR0cHM6Ly9naXRodWIuY29tL3R3aXN0ZWQvdHdpc3RlZC9yZWxlYXNlcy90YWcv
dHdpc3RlZC0yMi4yLjAKPiAKPiAgPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxm
b250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAKPiBDb21taXR0ZWQgdG8gMjAyMS4wMi54IGFu
ZCAyMDIyLjAyLngsIHRoYW5rcy4KPiAKCkFzIHJlcG9ydGVkIHJlY2VudGx5LCBweXRob24tdHdp
c3RlZCBhbmQgcHl0aG9uLXRyZXEgbXVzdCB1c2UgdGhlIHNhbWUgdmVyc2lvbjoKaHR0cDovL2xp
c3RzLmJ1c3lib3gubmV0L3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMi1GZWJydWFyeS82Mzc1MDUu
aHRtbAoKQnV0IHRoaXMgYmFja3BvcnQgcmVxdWlyZXMgdG8gdXBkYXRlIHB5dGhvbi10cmVxIHBh
Y2thZ2U6Cmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9OTMz
NDQ3YzI3YzQxZWJjZGI1ZWI5ZmEyYTM3NDQ1NjY5OWFlMzNmMgoKQmVzdCByZWdhcmRzLApSb21h
aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
