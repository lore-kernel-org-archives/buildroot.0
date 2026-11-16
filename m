Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4359606A32C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TTCvTXvU
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C6CA40722;
	Mon, 16 Nov 2026 15:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0I0a1grjE8_D; Mon, 16 Nov 2026 15:39:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AA23E40704
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843554;
	b=PiRu6Vr3UVeVB2UlMF621y4Th9mXFm1C6CJKpf1LM+P9q0sBX8HZCwtIWSa+PsCLA09y
	 ciqcFGqqzEjL1CHNMIBS9z1ADkAOpwGo5SRurRtyhgzZpD5MKbDL/paQJP2yAxY2BWKPI
	 uK8waAhRDzlkyyj6yU4+qDkD2ncPwf5/yN/bn1j1N72y2NlVNt0h68de6Y0Kz0cYRUCV7
	 qNKY2HVQHNkvDfHi4OvxByA61mv+2WL6vJ1lmi/JWqj1JWXNiYsjj9Vmk3R/1IPebPwWh
	 c7D1EVsX2fdHqO46MboGB9Q0AKYCXDBSHu5HVRgutzU+GTGGwtPhe7CZLHCT4vAia8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843554;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mBTdrCREf2zos8Ui0s1W0V+mTKIqH/FTQiE2zBLhq3Y=;
	b=bmtogcJHJloXvNTWxnLgywbPBZVLGG6DsRc4sXMgvIo+xAFAW4c0puosmJ5J01oQYh4J
	 vA/8YhZHn3aB8gczdrGNvk0+MkE2Z2YlkixJj5bNQuFzFSasJvexcLx+9rClRfT7s7g41
	 6qWm+QsNxzX2jbjSv7wVDSpOQavxIXlH8AhijlMiMDyQ6XCzB0Vckx2LRyfnzKGyE0IVv
	 rqtWka2rD69GPMRojqKpQHv/hcOJx7AlMQ2K7IwuiG9F+8ceAUFa1hCe+C8W6YhDDLQuI
	 6WdL7fKyMVU1UmnQAzDelHbPZq5ufk3HP5RhrWOWERCzYQ7pRrvjpIc5zEia94tOD9w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843554;
	bh=mBTdrCREf2zos8Ui0s1W0V+mTKIqH/FTQiE2zBLhq3Y=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=TTCvTXvUXRLVjYlrMEPYjEvXhKSUXlUdqJvwXDZ0+oY6vsxIAZtEjXuJMyt6ZkzKE
	 eQuO0g4/QDXhYjZExcsduPP+C6Sz0ZQ/QYyjOo7hLzF1zjrrRkQ1xYdFP4FvcYHbfa
	 HFo3vejaO7QqOWUMImJSf+mkBLK1cURLMHAa2zN2kDaVp95kjD/ZNUXmkdmXVEuoHY
	 tfprrMkGU0Ja8NMKXjO8u+W/aCtng+6mz5dlqiNVrefAP4Mr06h+euaZqyWryVAtuy
	 FZqqYlAcWT0AzB23SAJNjAYcwuBTtLjRNfRof2oxTFkBVrn/dIurV9eBffWRFciIP3
	 oWAAgVuAN6M8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA23E40704;
	Mon, 16 Nov 2026 15:39:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97E96109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89DFA80F0C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMNvL4Kq4SEe for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:39:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5D4AE80E48
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D4AE80E48
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so1988722f8f.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:39:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843550; x=1795448350;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4iOJwqXNe/WPeethf12KS/BOwyAFRsF2E+hMxQhCmD0=;
 b=u2RISzwKvpLSUQRUvAJSh0H+y9N+qSVMCuY13fq9Ld59N4u39dEJ06mH4ncRea9eXZ
 Bshv4k0L3WeW+DvJ/SVP9Cx2yykmGhIYvRLzBR7QtcjL2AT5lxPd4HKeuSNPkzhJjL2b
 OXo0EuO2kjjH5xKE17tXZ4+eOZPWXLJ9dRczGLH5kbX3nYSV4bW+Dzgubp97YLaRPIxD
 6lzmE5kBT9Ruz5Z2IPAjxDxuJd0zIFIjhpl7Ks7EHw4owwXEMZdDGPbS0kzx5WZCBQsX
 AZK0Drzhb9EKZGVh7Q5ZDTmp7HtErx8vBRWMAtiycHf3UUAOq6a7NWIKUKZ9Vs4HKXko
 R9Xg==
X-Gm-Message-State: APuU4Z8Q26DG79B/ARelM7JUSck/9Zoew1uNw/kZJUPL5/JlyM6m2oOV
 jTA7lev6q8zCI919/0FVgsUS7fpw0rK15HdovkdLeDjDui7MEvAKHzSTZBv74VfoZvX66IirRgm
 SI04z5EY=
X-Gm-Gg: AZFdTZfKZonVPwLCZEmy4egnLVnFi/O3l9tTdND74oYi3t4dKGxFJoAu7Zlnsv9cfZe
 UcAubMuGnw/hJ3wOrVaHfi+Qvt5B/Ts6oHrCqTXaRjkeiS9x6cKN9IlhLbZ1vIawZEJaH81MPea
 cQUxhrqN3Ka9VMWDgQb77O7VcpDNWMX/NYt+uP0gLF2ONkKrspuILfj1WFPfgp+juGi+OseZIn2
 62h7SNuWzvkAib62raJCuTj3kRwdPk5F61aX0cgZw1FDLitGbt1+R8r6yIZKfbBCnkHCfjlCHhz
 ryKiIoF3dTbVli3/MAKzdg1btBqlRHxY0+VptPNDaAejhk+8kS0m2h8VzGsouS6QoxVPo5KULOs
 z6ncEpGKsVMQsAxo4UqBCRWr/vtORWyG1W3AX5cZqqi/6qXAFXndN60uCfU68rVLRUQ6E6wMxlp
 Rnrw+fmeSz4t43a2/5G0jG2/AHIh9JvUbGIAF3hZh6TdSTIz+gvCOqPa5tl7i2M+VkZXuC6VYQy
 AUh95LcLd2k580wL74cmYGFCBhV4neyDxQsdgyroD8HgNHmfIU6uqD1D7E+mR588fmRMqyArUPa
 ovjVJbIKkjaEobP+Svwj+nQe65UgVMgr
X-Received: by 2002:a05:6000:1a89:b0:49d:7e8c:e8b2 with SMTP id
 ffacd0b85a97d-49d7e8cead9mr20283802f8f.11.1794843550069; 
 Mon, 16 Nov 2026 07:39:10 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c6d079a2asm20666042f8f.16.2026.11.16.07.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:39:09 -0800 (PST)
To: buildroot@buildroot.org,
 =?utf-8?b?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:39:07 +0100
Message-ID: <20261116153908.725199-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029215007.1788801-2-raphael.melotte@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for, 2025.02.x,
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gcmVwbHkgb2Y6Cj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwu
bWVsb3R0ZUBtaW5kLmJlPgoKQXBwbGllZCB0byAyMDI1LjAyLnguIFRoYW5rcwoKPiAtLS0KPiAg
Li4uLWZvci12YWx1ZS1mcm9tLWluaGVyaXRhYmxlLXByb3BlcnR5LnBhdGNoIHwgNDIgKysrKysr
KysrKysrKysrKysrKwo+ICBwYWNrYWdlL211cGRmL211cGRmLm1rICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMyArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbXVwZGYvMDAwMy1idWctNzA4ODQwLXVzZS1pdGVyYXRp
b24tZm9yLXZhbHVlLWZyb20taW5oZXJpdGFibGUtcHJvcGVydHkucGF0Y2gKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9tdXBkZi8wMDAzLWJ1Zy03MDg4NDAtdXNlLWl0ZXJhdGlvbi1mb3ItdmFs
dWUtZnJvbS1pbmhlcml0YWJsZS1wcm9wZXJ0eS5wYXRjaCBiL3BhY2thZ2UvbXVwZGYvMDAwMy1i
dWctNzA4ODQwLXVzZS1pdGVyYXRpb24tZm9yLXZhbHVlLWZyb20taW5oZXJpdGFibGUtcHJvcGVy
dHkucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmQ2M2Zk
YjgyMDkKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9tdXBkZi8wMDAzLWJ1Zy03MDg4
NDAtdXNlLWl0ZXJhdGlvbi1mb3ItdmFsdWUtZnJvbS1pbmhlcml0YWJsZS1wcm9wZXJ0eS5wYXRj
aAo+IEBAIC0wLDAgKzEsNDIgQEAKPiArRnJvbSBiMmYyOTM5ZDQwM2ViYTZkNWRkYmE0MGUzOTgx
ZjNiYWEwNmYwNzk2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBUb3IgQW5kZXJz
c29uIDx0b3IuYW5kZXJzc29uQGFydGlmZXguY29tPgo+ICtEYXRlOiBNb24sIDE1IFNlcCAyMDI1
IDE2OjMyOjA1ICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gQnVnIDcwODg0MDogVXNlIGl0ZXJh
dGlvbiBmb3IKPiArIHZhbHVlX2Zyb21faW5oZXJpdGFibGVfcHJvcGVydHkuCj4gKwo+ICtBdm9p
ZCBuZWVkbGVzcyByZWN1cnNpb24uCj4gKwo+ICsoY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCA3
MGI3MWFiMjJlNmRlNGQ0YzQ0Y2QzMDFjODgyMzFmNjIzYTRlOTRlKQo+ICtVcHN0cmVhbTogaHR0
cHM6Ly9naXRodWIuY29tL0FydGlmZXhTb2Z0d2FyZS9tdXBkZi9jb21taXQvNzBiNzFhYjIyZTZk
ZTRkNGM0NGNkMzAxYzg4MjMxZjYyM2E0ZTk0ZQo+ICtDVkU6IENWRS0yMDI1LTcxMzgyCj4gK1Np
Z25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4K
PiArLS0tCj4gKyBzb3VyY2UvaHRtbC9jc3MtYXBwbHkuYyB8IDEzICsrKysrKy0tLS0tLS0KPiAr
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gKwo+ICtk
aWZmIC0tZ2l0IGEvc291cmNlL2h0bWwvY3NzLWFwcGx5LmMgYi9zb3VyY2UvaHRtbC9jc3MtYXBw
bHkuYwo+ICtpbmRleCAwNzAzODNiMGYuLjY1Zjg2YjQ3MCAxMDA2NDQKPiArLS0tIGEvc291cmNl
L2h0bWwvY3NzLWFwcGx5LmMKPiArKysrIGIvc291cmNlL2h0bWwvY3NzLWFwcGx5LmMKPiArQEAg
LTc5MiwxNSArNzkyLDE0IEBAIGlzX2luaGVyaXRhYmxlX3Byb3BlcnR5KGludCBuYW1lKQo+ICsg
c3RhdGljIGZ6X2Nzc192YWx1ZSAqCj4gKyB2YWx1ZV9mcm9tX2luaGVyaXRhYmxlX3Byb3BlcnR5
KGZ6X2Nzc19tYXRjaCAqbWF0Y2gsIGludCBuYW1lKQo+ICsgewo+ICstCWZ6X2Nzc192YWx1ZSAq
dmFsdWUgPSBtYXRjaC0+dmFsdWVbbmFtZV07Cj4gKy0JaWYgKG1hdGNoLT51cCkKPiArKwl3aGls
ZSAobWF0Y2gpCj4gKyAJewo+ICstCQlpZiAodmFsdWUgJiYgIXN0cmNtcCh2YWx1ZS0+ZGF0YSwg
ImluaGVyaXQiKSkKPiArLQkJCXJldHVybiB2YWx1ZV9mcm9tX2luaGVyaXRhYmxlX3Byb3BlcnR5
KG1hdGNoLT51cCwgbmFtZSk7Cj4gKy0JCWlmICghdmFsdWUpCj4gKy0JCQlyZXR1cm4gdmFsdWVf
ZnJvbV9pbmhlcml0YWJsZV9wcm9wZXJ0eShtYXRjaC0+dXAsIG5hbWUpOwo+ICsrCQlmel9jc3Nf
dmFsdWUgKnZhbHVlID0gbWF0Y2gtPnZhbHVlW25hbWVdOwo+ICsrCQlpZiAodmFsdWUgJiYgc3Ry
Y21wKHZhbHVlLT5kYXRhLCAiaW5oZXJpdCIpICE9IDApCj4gKysJCQlyZXR1cm4gdmFsdWU7Cj4g
KysJCW1hdGNoID0gbWF0Y2gtPnVwOwo+ICsgCX0KPiArLQlyZXR1cm4gdmFsdWU7Cj4gKysJcmV0
dXJuIE5VTEw7Cj4gKyB9Cj4gKyAKPiArIHN0YXRpYyBmel9jc3NfdmFsdWUgKgo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL211cGRmL211cGRmLm1rIGIvcGFja2FnZS9tdXBkZi9tdXBkZi5tawo+IGlu
ZGV4IGY3ODBkYTJlYjUuLjc2ZTVkYjlmNmQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tdXBkZi9t
dXBkZi5tawo+ICsrKyBiL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsKPiBAQCAtMzMsNiArMzMsOSBA
QCBNVVBERl9JR05PUkVfQ1ZFUyArPSBDVkUtMjAyNi0yNTU1Ngo+ICAjIDAwMDItYnVnLTcwODUy
MS1hdm9pZC1yZWN1cnNpdmUtY3ljbGUtd2hpbGUtc3RyaXBwaW5nLW91dGxpbmVzLnBhdGNoCj4g
IE1VUERGX0lHTk9SRV9DVkVTICs9IENWRS0yMDI1LTQ2MjA2Cj4gIAo+ICsjIDAwMDMtYnVnLTcw
ODg0MC11c2UtaXRlcmF0aW9uLWZvci12YWx1ZS1mcm9tLWluaGVyaXRhYmxlLXByb3BlcnR5LnBh
dGNoCj4gK01VUERGX0lHTk9SRV9DVkVTICs9IENWRS0yMDI1LTcxMzgyCj4gKwo+ICAjIG11cGRm
IGRvZXNuJ3QgdXNlIENGTEFHUyBhbmQgTElCUyBidXQgWENGTEFHUyBhbmQgWExJQlMgaW5zdGVh
ZC4KPiAgIyB3aXRoIFVTRV9TWVNURU1fTElCUyBpdCB3aWxsIHRyeSB0byB1c2Ugc3lzdGVtIGxp
YnJhcmllcyBpbnN0ZWFkIG9mIHRoZSBidW5kbGVkIG9uZXMuCj4gIE1VUERGX01BS0VfRU5WID0g
JChUQVJHRVRfTUFLRV9FTlYpICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSBcCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
