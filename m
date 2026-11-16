Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5678606A322
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CR78kHPR
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E435407F6;
	Mon, 16 Nov 2026 15:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x60qETYqUXtk; Mon, 16 Nov 2026 15:40:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9CF46407EC
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843602;
	b=cv7KbyRTAa0rZWLmdqtuse/i4wdg6NfWu6D2xEe/brHESV/1jgf7yW7VuuizGYalxk0O
	 NCgC3j5UkTCcjOCWC2eouxGp9oVd142vQWxq3QyxKVtj/YQ/zYlPAMCVt3aqWCmxs20qn
	 ktg5qLz7oVG+9vyrkK7B2N1XHGORftdY5yk3KaTsjJ0ZK86tGLXWMT0ynB/sEbsnaqXRa
	 HU8KMrz6C5oYi8McBsZr8hfkcROE/mX4uT1qQ/8fwm0ubUJ7x1Sqfx1GE16H0tM8W8rq9
	 REwvvNnVUG57oyXCa+OO+hDbnM25gXNwhajS2KSXKYkIXyG9XnryK7mWauq3IS1TKew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843602;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BsRtMtA77TOk0n8IaBnmAgumssMMxAoxwem72rHamWA=;
	b=reRQeSne74cZJwf5GsjYK4vrXw5c2u3i7f5Dl+s8qT/Tz/mWAkIlSfbjjqY/AJax98gC
	 2kiHh0Gl+7v0emVFmbyx+qFwDVneqLXBJhU0Vep4gVPiPQMObRsxf12Jjd8h/DNfafqVp
	 DJ/Irlfp6A59UvddexuK49slN9htxKhYoA8EI8i9BwrOrUaV7AFEyaHfq1ko900O7cjXW
	 zUKSOO+bu07yW27bHFf7zRdwAZ8Xla467eGUy7FqJ5DCp/Ymw7MP6BeFJB5IOpgvAsy4u
	 CgZ6X020FjoqX6Anglmd8Al5GIecbc9px6A5ucMzJB/h7IcP8jHFExe17Xrl5lIq7xg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843602;
	bh=BsRtMtA77TOk0n8IaBnmAgumssMMxAoxwem72rHamWA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=CR78kHPRZWnpQ4JpR2Dk34qDGl8bZitA0a7hjNVt7TuGn5s4nWvvWci9ev4wuklXF
	 WzBppNCa9PpY+o/B862LLZ88VLw9/aOzI+hJ4By8CRZ789h0odxCaBqR+/CLy4MdqU
	 uvQJGuhfYgcRwFIul6CZ8ifJHcQpkzXSiYV2QmOxx3LsOyR9D9ClSKC3MD2Lhu/ANY
	 mbPwmiXCrF2tve/TXa5uGb5uJ9VsTziu3n0i6QoNGW0/ncbyxH8R00pNkwGGX/bq4E
	 6+WJQzRG/1QQ4ZGkVaDvdpGv7vi4ER48lXp2Zi9jSI5GETuESOlfAQsyc68912JskL
	 eQw+3eAlkn6Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CF46407EC;
	Mon, 16 Nov 2026 15:40:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13E33109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA3AC6082C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AiFGIbalORG3 for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:40:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BA30360793
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA30360793
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:00 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4bb606491faso11476835e9.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:40:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843599; x=1795448399;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ougk7q6aDQu743hTDedJyqNExjmjKDnVaxu3lPmWTZI=;
 b=X1S5XwgL4GxPyRNbnxfkhFvgn1aHGli0rq2o6ZhecHRhJ+et35hPaptNOYgnvmnSSj
 /gbZn+wqhqwZC2XPAtoMO+xmgQ/MTh2LFeqWlmLBik6naPWzoXKu4uWsGuHRG7yAuP9i
 yZ+cQDQpW25t+FVx83dsctTlR/ZYuer5zdQKbwUD21V4W5o9Xgc1SOIa0X7ZJpZT8k2v
 QMuvpXGL0WEs4A1IHaHZPSEKJFaFReG1GDNo2Bpxl1+bQ/53CmgcszzZifPg/ukhbEh9
 3IsNCS0G2zmkzMSKDJOOwc0KqxjFnVDiVBsTCFqwiDD9kohu0CcSrLM470wspVA8Ltlm
 5Fgg==
X-Gm-Message-State: APuU4Z9uDCwjGC96K8O/3I5P7ayNIbVKy+PIfPMu3GpylcRIC+nKvTjV
 trDxqajD/JyhIAUYqQxoWBwTjkSMJA4q6lEzDDxqP6SPvDHYw1b9yw/KT+2PbSjyKUTMJbO/7jR
 qFJ3pG9I=
X-Gm-Gg: AYBFou1su6VBv5yyAyvC1yEwit6/SaU18vnBVry062dkRg5RoebhJpKCpjIPWZWgrv1
 do79wpKWfDhEb+gfQUEuv/VQ4H7+vvSpA2pP+xA7OS4flcEGafWDnosZ2tWOC1BOjaHvyYx0uMh
 Gxn9jD5UNIaFxh2wkPQWK7gU1pGg9n8CmiH43o/JlEhUEUrCzL0zZuIjdi7VgObWRlOxbUAeYci
 C0NLcLlINCQpNpwCnPqjNm4CKaaOSPBs/Enz7CAgie+mQz/DyJB+8NKmw+gLkVeM3Wv9lXM+tYy
 ExGzdAjnu0LsDhttJGmmFHJrT5Px5GkWXMu1CBtuvLZI29LaX6u8LPwZrt+1bT9T48UWJqikFfa
 fPkaqZeND22w7uj1e6ivN3A5WYutCK+J86W8jgMjKaYlySdeaJ5IcJKgw9b500rKn404ABb/eA5
 28FSHxcvP/COOjGjt4q5sZVxiTOrZxqdBIL29osKv9rjdWdkdGll4GyB034d6eE4Dj6Gww71Tl9
 jSK+xqHVBt0MwQlTU+GuFNMEw+kffzMTI6JXTUOpVCwnqkOaWVhymPHCAm/Xtrmz/wOpqb64FHu
 guMunpO3KKV14q8VWyoOlDctjbwDxnRIfvvVJiQ6/LJ8sK+inAp1
X-Received: by 2002:a05:600c:3509:b0:4a1:dbdf:17a8 with SMTP id
 5b1f17b1804b1-4bb559f2cc3mr224443605e9.2.1794843598725; 
 Mon, 16 Nov 2026 07:39:58 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e2842e6sm407306195e9.4.2026.11.16.07.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:39:58 -0800 (PST)
To: buildroot@buildroot.org,
 =?utf-8?b?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:39:55 +0100
Message-ID: <20261116153957.725677-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103102334.180654-1-raphael.melotte@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/composer: security bump to
 version 2.11.1
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

SW4gcmVwbHkgb2Y6Cj4gQ29tcG9zZXIgMi41LjggYnVuZGxlcyBjb21wb3Nlci9jYS1idW5kbGUg
MS4zLjUsIHdoaWNoIHN0aWxsIGNvbnRhaW5zCj4gdGhlIGVtU2lnbiBFQ0MgUm9vdCBDQSAtIEcz
IGFuZCBBQUEgQ2VydGlmaWNhdGUgU2VydmljZXMgcm9vdHMgdG8gd2hpY2gKPiB0aGUgY29tcHJv
bWlzZWQgZU11ZGhyYSBpbnRlcm1lZGlhdGUgQ0FzIGNoYWluIChbMV0pLgo+IAo+IENvbXBvc2Vy
IDIuMTEuMCB1cGRhdGVzIGNvbXBvc2VyL2NhLWJ1bmRsZSB0byAxLjYuMCwgd2hpY2ggbm8gbG9u
Z2VyCj4gY29udGFpbnMgdGhlc2Ugcm9vdHMsIGFuZCBhbHNvIHJlamVjdHMgVExTIGNvbm5lY3Rp
b25zIHByZXNlbnRpbmcgdGhlCj4gY29tcHJvbWlzZWQgaW50ZXJtZWRpYXRlcyBldmVuIHdoZW4g
dGhlIHN5c3RlbSBDQSBzdG9yZSBzdGlsbCB0cnVzdHMKPiB0aGVpciByb290cyBbMl0uIDIuMTEu
MSBpcyB0aGUgbGF0ZXN0IHJlbGVhc2UuCj4gCj4gVGhpcyBhbHNvIGluY2x1ZGVzIHRoZSBvdGhl
ciBzZWN1cml0eSBmaXhlcyByZWxlYXNlZCBzaW5jZSAyLjUuOCAoc2VlCj4gdGhlIHBhY2thZ2Un
cyBjaGFuZ2Vsb2cgZm9yIHRoZSBjb21wbGV0ZSBsaXN0KS4KPiAKPiBDb21wb3NlciAyLjExLngg
cmVxdWlyZXMgUEhQID49IDcuMi41LCB3aGljaCBob3N0LXBocCBzYXRpc2ZpZXMuCj4gCj4gUmVs
ZWFzZSBub3RlczogaHR0cHM6Ly9naXRodWIuY29tL2NvbXBvc2VyL2NvbXBvc2VyL3JlbGVhc2Vz
L3RhZy8yLjExLjEKPiBDaGFuZ2Vsb2c6IGh0dHBzOi8vZ2l0aHViLmNvbS9jb21wb3Nlci9jb21w
b3Nlci9ibG9iLzIuMTEuMS9DSEFOR0VMT0cubWQKPiAKPiBbMV06IGh0dHBzOi8vZW11ZGhyYS53
ZS1oYXZlLWEtcHJvYmxlbS5jb20vCj4gWzJdOiBodHRwczovL2dpdGh1Yi5jb20vY29tcG9zZXIv
Y29tcG9zZXIvcHVsbC8xMzE0Ngo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRl
IDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KCkFwcGxpZWQgdG8gMjAyNS4wMi54LCAyMDI2LjA4
LnguIFRoYW5rcwoKPiAtLS0KPiAgcGFja2FnZS9jb21wb3Nlci9jb21wb3Nlci5oYXNoIHwgMiAr
LQo+ICBwYWNrYWdlL2NvbXBvc2VyL2NvbXBvc2VyLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2NvbXBvc2VyL2NvbXBvc2VyLmhhc2ggYi9wYWNrYWdlL2NvbXBvc2VyL2NvbXBvc2Vy
Lmhhc2gKPiBpbmRleCAxMjNkNmRlMWJlLi4wMjAwMmZhN2EzIDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvY29tcG9zZXIvY29tcG9zZXIuaGFzaAo+ICsrKyBiL3BhY2thZ2UvY29tcG9zZXIvY29tcG9z
ZXIuaGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+ICAjIEhhc2ggZnJvbSBodHRwczovL2dldGNvbXBv
c2VyLm9yZy9kb3dubG9hZC8KPiAtc2hhMjU2ICBmMDc5MzRmYWQ0NGY5MDQ4YzBkYzg3NWE1MDZj
Y2EzMWNjMjc5NGQ2YWViZmMxODY3ZjNiMWZiZjQ4ZGNlMmM1ICBjb21wb3Nlci0yLjUuOC5waGFy
Cj4gK3NoYTI1NiAgNmYxYjg5MWUxZDQ5MjdkNjI3NDAyNzZjNTQwZmI0OTBlNDc2ODllMTllMTAy
YzQ5ZThkYTg0OTc5NDg4MmY4YyAgY29tcG9zZXItMi4xMS4xLnBoYXIKPiAgIyBMb2NhbGx5IGNh
bGN1bGF0ZWQKPiAgc2hhMjU2ICBjOGNjZTRiNmI5NzI5ZjI2NGZmZGY5Mjk2ZDUwNWQ2MzQzMjQ5
N2ZlZWVkMWY1ODZkMTkwMmI5NDIxOTdlMDI0ICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvY29tcG9zZXIvY29tcG9zZXIubWsgYi9wYWNrYWdlL2NvbXBvc2VyL2NvbXBvc2VyLm1rCj4g
aW5kZXggNWFkZTljY2NjZi4uZDUwOWRjNjE3ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2NvbXBv
c2VyL2NvbXBvc2VyLm1rCj4gKysrIGIvcGFja2FnZS9jb21wb3Nlci9jb21wb3Nlci5tawo+IEBA
IC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1DT01Q
T1NFUl9WRVJTSU9OID0gMi41LjgKPiArQ09NUE9TRVJfVkVSU0lPTiA9IDIuMTEuMQo+ICBDT01Q
T1NFUl9TT1VSQ0UgPSBjb21wb3Nlci0kKENPTVBPU0VSX1ZFUlNJT04pLnBoYXIKPiAgIyBIZXJl
LCB3ZSBwYXNzIGEgZHVtbXkgVVJMIHBhcmFtZXRlciBpbiBvcmRlciB0byBjb250cm9sIHRoZSBu
YW1lIHRoZSBmaWxlCj4gICMgd2lsbCBoYXZlIG9uY2UgZG93bmxvYWRlZC4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
