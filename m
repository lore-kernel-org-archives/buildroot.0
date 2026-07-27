Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F0CC531D0
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 14:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34DF0606F4;
	Mon, 27 Jul 2026 14:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxqQvACWUmWU; Mon, 27 Jul 2026 14:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64411606A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785160913;
	bh=7jRx4jRFoLh44657I/EAz1FV1xf7we8RMtq4G7W/6z8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PAIik1/Wzk+aqQoxHNw7hJ+DW+dDml2U04uHzDglkP3Bt35JhJ444184wlGzdwM13
	 d21bqizKWvdbi7zgowI0yoOLPOaCPF1oIiQv1WR0yBU9o+cjgw3xZCyzmk01/mEUcE
	 YSH7NBlUQqodUnE1hU/yfFtM1cmBelbDsT8gIub4mQuSzW9nsRbQBJkDqGq0BHHHPj
	 is7RLW4AqhR9lbVeBkptL5InnW/rlZe71TWuqcTGk5oGs7xXgoj8a87pBObl3QaZkF
	 zpGCdE3jG7183C+E/8OOQekMBuNLP31AS5Q89J/QssBBOo5ey35jRRAjP5wQN7r2Fx
	 YP2ka5q8lXO6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64411606A5;
	Mon, 27 Jul 2026 14:01:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C40B357
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 14:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1181B80E34
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 14:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6LAaP3QZw1BT for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 14:01:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9CAC980E2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CAC980E2E
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CAC980E2E
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 14:01:49 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 90B39C2791;
 Mon, 27 Jul 2026 16:01:46 +0200 (CEST)
Message-ID: <6188fae4-a320-4b1d-ad6b-92a9d437c6bf@grenoble.cnrs.fr>
Date: Mon, 27 Jul 2026 16:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Titouan Christophe <titouan.christophe@mind.be>, 
 Fiona Klute <fiona.klute@gmx.de>
References: <a00e615b-c2b2-42d9-b525-8852fc0d74a4@grenoble.cnrs.fr>
 <20260727125040.380483-1-thomas.perale@mind.be>
Content-Language: en-US, fr
In-Reply-To: <20260727125040.380483-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1785160906;
 bh=XjTE7QDdwzRIde5KkYNbX6lrp0PEPioebJEi9e70DDA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nXLw3iN+nd1l6uVK5EAL2P6TEdqctc+mkScUnX/hdnWO9M1/D+sCbHhRfWGUQLGV4
 y03khkzS35mynSywzbM6u5Ei/9SKyW2ZsoVnTPJqDcuDTKxNDn/NOpQ8fUgVsk20zD
 IOgT56Z2zoCLes2mjAGqEYWKjOIQaOoXCiv217KBDTnCKIt/pAnOLXnO7ZSaRREsTj
 VDb30kU/wSZ2+3YMRVPx9LmUvVtoXKSdDJgW95qo+zF0b8H8bphibHuco5ePhepqdI
 BqiP/CLTG4mlNJ5Cg9p9ZoZYrJEdUq3Gleo0CpJew64sQlIZuzosgKN3pmRzbJMHxQ
 hMImH4rquzvOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=nXLw3iN+
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: update 'releases' to
 reflect LTS changes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzISBIZWxsbyBldmVyeWJvZHkhCgpPbiAyMDI2LTA3LTI3LCBUaG9tYXMgUGVy
YWxlIHdyb3RlOgo+IEluZGVlZCwgaW1vIHRoZSBwcmV2aW91cyBjYXRlZ29yaXphdGlvbiBpbnRv
IHN0YWJsZSAtIGx0cyBhcyBhIHN1YnNldAo+IG1hZGUgaXQgbW9yZSBjb25mdXNpbmcgdG8gbWUg
YW5kIGNsZWFybHkgbWFraW5nIHRoZSBkaWZmZXJlbmNlIGV4cGxhaW4KPiB0aGUgZGlmZmVyZW5j
ZSBsaWZlY3ljbGUgYmV0dGVyLgoKSSBhZ3JlZSB0aGF0LCBpbiBnZW5lcmFsLCB1c2luZyBub24t
b3ZlcmxhcHBpbmcgY2F0ZWdvcmllcyBtYWtlcyBmb3IgYQptb3JlIGludHVpdGl2ZSBtZW50YWwg
bW9kZWwuCgo+IEkgd291bGRuJ3QgcmVuYW1lIGl0IHRob3VnaCBhcyBwZW9wbGUgYXJlIGFscmVh
ZHkgdXNpbmcgdGhpcyBuYW1pbmcKPiBjb252ZW50aW9uLgoKVGhlIGN1cnJlbnQgdmVyc2lvbiBv
ZiB0aGUgcGFnZSBoYXMg4oCccXVhcnRlcmx5IHJlbGVhc2Vz4oCdLCBhbmQgRmlvbmHigJlzCnJl
bWFyayBvbiDigJxzdGFibGUgcmVsZWFzZXMiIGJlaW5nIHJlZHVuZGFudCBpcyBzcG90IG9uLgoK
SSBzdWdnZXN0ZWQg4oCcaW50ZXJpbSByZWxlYXNlc+KAnSBiZWNhdXNlIHRoZSB0ZXJtIGlzIGlu
IGNvbW1vbiB1c2UgaW4gdGhlCmNvbnRleHQgb2YgVWJ1bnR1LiBJIGFtIG5vdCBhd2FyZSBvZiBh
IHNpbWlsYXIgdGVybSBpbiB0aGUgY29udGV4dCBvZgp0aGUgTGludXgga2VybmVsOiB0aGV5IHNl
ZW0gdG8gdXNlIOKAnExUU+KAnSBhcyBhIHN1YnNldCBvZiDigJxzdGFibGXigJ0uCgo+IERpZCBp
dCBtYWtlIG1vcmUgc2Vuc2UgdG8geW91IHRvIGNvbnNpZGVyIExUUyBhcyBhIHN1YnNldCBvZiBz
dGFibGU/CgpOb3QgcmVhbGx5OiBJIGxvb2tlZCBhdCB0aGUg4oCcc3RhYmxl4oCdIGxhYmVsIGFz
IGEgc29tZXdoYXQgYW1iaWd1b3VzIHRlcm0sCnVzdWFsbHkgZGlzYW1iaWd1YXRlZCBieSB0aGUg
Y29udGV4dC4gSXQncyBqdXN0IHRoYXQgSSBmaW5kIGEgYml0CnRyb3VibGluZyB0aGUgaWRlYSB0
aGF0IExUUyByZWxlYXNlcyBzaG91bGQgbm90IGJlIGNvbnNpZGVyZWQg4oCcc3RhYmxl4oCdLgoK
UmVnYXJkcywKCkVkZ2FyLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
