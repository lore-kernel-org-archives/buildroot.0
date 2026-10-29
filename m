Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97C6606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NQIyDyXo
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96B3D40A9D;
	Thu, 29 Oct 2026 21:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGA4mM-7alOC; Thu, 29 Oct 2026 21:50:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5FB7B40A8F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793310626;
	b=IfJi6/ygdyhd426+YDqTUANwAUXbFJmSek9Se/1XrBVJVMcYYw0Oue7RA/ZBHpmARLGz
	 qsbPemXrogQ4xhREtXP97c+hzWJgsi8P7JUrvCKBHEbn6qoeWSFhROS+gD7UdS44YGiSE
	 oOkblWYqLz7jI6a93NhF4EcKxGjmYmfdBBRQb+QZuWA1U+g36czJZc81MAAobqNHCVjaZ
	 bdAg5Vtk6/gvMIxc9hYmrCgp7ScRvf8gJd4z48BbSoj9eiWtkJ69vlrF+S8KtAwlVowl/
	 If6Wm8O36QC7pHbhQzUU+ldItiBrz5aw2E3BZd80w8T/+vRNluTzGwPvmejGzE1gNfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793310626;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mKS6H+fGvoG+Zzs8wOY6j34LoTjKHhjV8YrNKU7FJCM=;
	b=M+j4zxAi4gmwv+j/lO1Mldkun5D0SBJ+9AXApgvo1sHAmFvQH5qvbiU65Lp6Qcyap/5N
	 LgZgDONpaCuc+lrhcizCB41j7I4OGMUAuD7U32FWw+XHztVI34rcvMAIH7F53GqyDxlzR
	 +XTFkI9/T8cChngFPOv1UftV4HmWLq3mSv9srhN+yqadR8lwrVwPdi25YOhHhAbqPooW8
	 mZAFzdtLUxBJ8LIctqtEu09hBFDcgq/YYdjyYxRVLym0AzeR+UB85VHnIggPviOdKyn6o
	 l6qfaNSZL24ZqKdjC/3fWKbT4MrQI2jkAg1Yrot4VCmvPgkrWSNVGbMFuSz68hMvlGg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793310626;
	bh=mKS6H+fGvoG+Zzs8wOY6j34LoTjKHhjV8YrNKU7FJCM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NQIyDyXoCiryRMbuBrxbT4fFi5ghV/B1Hv0c0iJXD/q/B7gqgc2AYRDktE4TqWcHt
	 pQcQa8KsHg9QCfYpsEZ07SScg3xRrDv/PR1pbBcfjVVSBX6Rlv8RPXru8uTHKMRcqc
	 QB/RVt6hxTq9F8BdxK4g6H0lTVJuwxqj5ILztBs/HNmQSxIK5vbPO2q207f6m5m+Yb
	 dnGqkDiOJ0BHkwp9zO8nYgcGrs2ifcze15v9cxCBDADhQF+sCyw2Qq7G4qSoQQdar9
	 mkxsqQSRMixbexQ+HGGjNPjhpglC1sawkdUE6wbs0QWXzmkTd6vNO3VmPqMUiwt0WQ
	 ec0JW/RfJ8olA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FB7B40A8F;
	Thu, 29 Oct 2026 21:50:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 77D411DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10CA940A8D
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSHj54yqpDnZ for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:50:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9433440A6B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793310621;
 b=AkvolIpy/+N5NpT0FOHVnPSAvrB/X30LG/EdkYKvJWwR3FF2rQU7vfsR1sVHKHxq3+wR
 itlFdX1CusBwVIx104Juwgn2SEBj7iFoDwazgmDP/7yjnb1VDG49R7F+TQyQ9bWyH3nMk
 e1UY/DFuGNw3tNsjOoctRpSGpErYEXtjZ+8z8nEKJZ5JN24J6XH4WH/3vPpgHZl7H+2zV
 aR3B0JDfFRmPsBHo27WZEbXPOlwtWw9Vd7Lfi+4YftVWxb8oOgeSPxWfaX898uNqkatsv
 QIeEubKAb1fR0gd3ZO7fUhbfPqYy1wGUJBwUkHDEaZnH/h8EoXmi66+0jvn2aLbqfjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793310621;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=/e08J+cSXgn/voqK+UWs8EcZ1d0s3UIIHsvcLx6zqEc=;
 b=psfgXX7T8X59L+HLzPyti24QJCNG1rVDDuf3hREm6ubAJ/Mc9ix2TWlLMxKXygv168Ih
 IHpQq7yH9r/EXDvFpO+AsJ1MdLrTUUb8vtNVaAmOT9m3Qo2P82IBLE0SnkqVPtyqEpqeJ
 cTVKkjpf0gJYe4GaKiZd1gxwMGeYP5xA2eHou8MKJVFYNgfC7VpJrI2j7WzMfoMzJBOeX
 5DsdNoQ3B7dwg91P68nNvJQWDaCPKt0OYWvi9d6UGaWi0wp6PgMbaQJX9DxdB33dvkBhY
 glQH3j0NmPvrCUAx11SOfpDled72pzPQXemxf8uzB6hUVhMTmYAvdU0igmdDvOB+BWw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Au5DPY4Q; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9433440A6B
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:50:20 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4956869750eso187995e9.2
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793310618; x=1793915418;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/e08J+cSXgn/voqK+UWs8EcZ1d0s3UIIHsvcLx6zqEc=;
 b=BURcAKdSd7Phspjie16vtipA81wQcNAgPO2BHaqkZMblEPv4j7UfZ+hsfMlUcMroNh
 ieHDLGiMJsHpL9Dt3QQpBMHP2nTmMRQCPLlF1fBCIJhFYV9nHiEuI7KKDsY68CyENOCK
 adaWrLvc+HTN7aoyL40QvHmH/ockOKzTv8axEb00W8CRVq5z8AsKAzmpIULcyVkISHzk
 lkX+6Y+JoE97leyKOjMGghZaMmuJ/uWmGlgLQjk5PlDkKSe0Lyvpxcxer1sRca+j2Evi
 Vv+lhHF7+HA6xpQJ6yCDqi32V0yDEbiW9OlV2kg625vfdTKs/bRk6SPBYeoBnA0tZlta
 QOnw==
X-Gm-Message-State: AFq9FYLT6ghtNLXsVMZMtVnN5EJjIsOiKP3GPSB9X3kEWeLDxroG2WOM
 BnkFSny8Az4z7LoqOnGJ/rqhdMP3ZIzqlgCLCX+2e2TE712OGDSZsmt3+Hmdqar8YulmCmvyaZf
 TOQiz1BSWFg==
X-Gm-Gg: AYBFou0wccWx8EZIcTejiwJU1NXI+gyYgHTy8FbVm5lrzrk75QkTnt0d0fXzZxTUt5v
 JDgaR7K7uDjGFKVoVXh5PDMsOQvX69KZbvcXKqj8iYVi8ojdFmr6rlHJJgxVQ0CBjleyEMPi3RN
 GtgJ6ckqDbK1LbKyHxLCUwarHp0S6IkxUpK146xV/V4U2s3ZDrAWVb/4x1Uv0gVoN0htYrUahEJ
 lgJL4xTt9XGgv6/JDwvuN6M3LummHTCAYuS65WoakJWFFVi8MEdZnOr3qFb4fI1Ns88OX/RnQ3a
 QZqXlI/C+J9/J18YyQGIPWalDrjdhkPB0yVv9ire9nhFOcuY9foXVOAPL9l+ozCWu3y9x48kAuo
 fvUfQNr2TLvx7sL3w8Vmlr7R97ec/BMzVBNiie/TJCQJMCpE9jPM7cUSVIblEcoK2ZB8phj6280
 JKTAuYYBxGkP4NR7tsDCVnT3JoPi2G9kcrLg/qxP+7u6pUn9MrWOzRihyeJMKrL+YlRzeO3i1Ve
 9hq/z+TMJmNPDZSJLbFcgIh4elvwr3KoLLNSbIGV+oC/QegUyFJxiu12XAw1UhcDFnCKfCr9xq5
 lGGjwP8IhWf9SmF2lfKaVPFBg/ftaKp+3loQP9AUVUCa
X-Received: by 2002:a05:600c:6095:b0:49e:7c8c:361d with SMTP id
 5b1f17b1804b1-4ac182dc30fmr5875515e9.22.1793310618121; 
 Thu, 29 Oct 2026 14:50:18 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf396dfdbsm14406245e9.1.2026.10.29.14.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 14:50:17 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu, 29 Oct 2026 22:50:03 +0100
Message-ID: <20261029215007.1788801-4-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029215007.1788801-1-raphael.melotte@mind.be>
References: <20261029213546.1783883-3-raphael.melotte@mind.be>
 <20261029215007.1788801-1-raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for, 2025.02.x,
 2026.08.x 4/4] package/mupdf: ignore CVE-2026-7233
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Q1ZFLTIwMjYtNzIzMyBpcyBhbiBvdXQtb2YtYm91bmRzIHJlYWQgaW4gZnpfc3Vic2V0X2NmZl9m
b3JfZ2lkcygpLCBpbgpzb3VyY2UvZml0ei9zdWJzZXQtY2ZmLmMuIFVwc3RyZWFtIGFkZGVkIHRo
aXMgZmlsZSBpbiBjb21taXQKN2NhZDM1NDU5ZDkxICgiU3Vic2V0IENGRiBmb250cyIpLCB3aGlj
aCBpcyBmaXJzdCBpbiByZWxlYXNlIDEuMjQuMC4KTmVpdGhlciB0aGUgZmlsZSBub3IgZnpfc3Vi
c2V0X2NmZl9mb3JfZ2lkcygpIGFyZSBpbiB0aGUgMS4yMy54IGJyYW5jaAphbmQgdGh1cyBtdXBk
ZiAxLjIzLjkgaXMgbm90IGFmZmVjdGVkIGJ5IENWRS0yMDI2LTcyMzMuCgpGb3IgbW9yZSBpbmZv
cm1hdGlvbiwgc2VlCiAgLSBodHRwczovL3d3dy5jdmUub3JnL0NWRVJlY29yZD9pZD1DVkUtMjAy
Ni03MjMzCiAgLSBodHRwczovL2dpdGh1Yi5jb20vQXJ0aWZleFNvZnR3YXJlL211cGRmL2NvbW1p
dC83Y2FkMzU0NTlkOTEKICAtIGh0dHBzOi8vZ2l0aHViLmNvbS9BcnRpZmV4U29mdHdhcmUvbXVw
ZGYvY29tbWl0LzYxMWY3NWYwYzg2NTdiOTI0NjA1NTQwMDkxOTZjNWFjNGI2OGQ5MDkKClNpZ25l
ZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KLS0t
CiBwYWNrYWdlL211cGRmL211cGRmLm1rIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL211cGRmL211cGRmLm1rIGIvcGFja2FnZS9t
dXBkZi9tdXBkZi5tawppbmRleCBhYzkwOTVhMmZiLi4xOGFmZjc3MzA0IDEwMDY0NAotLS0gYS9w
YWNrYWdlL211cGRmL211cGRmLm1rCisrKyBiL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsKQEAgLTM5
LDYgKzM5LDkgQEAgTVVQREZfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjUtNzEzODIKICMgMDAwNC1i
dWctNzA5MTA4LWRvbi10LXByaW50LXJhdy1mb250LW5hbWUtdG8tdGVybWluYWwucGF0Y2gKIE1V
UERGX0lHTk9SRV9DVkVTICs9IENWRS0yMDI2LTQwNTA1CiAKKyMgVGhlIHZ1bG5lcmFibGUgY29k
ZSAoc291cmNlL2ZpdHovc3Vic2V0LWNmZi5jKSB3YXMgYWRkZWQgaW4gMS4yNC4wLgorTVVQREZf
SUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjYtNzIzMworCiAjIG11cGRmIGRvZXNuJ3QgdXNlIENGTEFH
UyBhbmQgTElCUyBidXQgWENGTEFHUyBhbmQgWExJQlMgaW5zdGVhZC4KICMgd2l0aCBVU0VfU1lT
VEVNX0xJQlMgaXQgd2lsbCB0cnkgdG8gdXNlIHN5c3RlbSBsaWJyYXJpZXMgaW5zdGVhZCBvZiB0
aGUgYnVuZGxlZCBvbmVzLgogTVVQREZfTUFLRV9FTlYgPSAkKFRBUkdFVF9NQUtFX0VOVikgJChU
QVJHRVRfQ09ORklHVVJFX09QVFMpIFwKLS0gCjIuNTQuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
