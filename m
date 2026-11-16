Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1058606A32A
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Eh56y1kB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ED046082C;
	Mon, 16 Nov 2026 15:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHpSBUYrVUyo; Mon, 16 Nov 2026 15:40:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3452060821
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843601;
	b=QFzAx/EMFfkKSx7dqIZiY4A87u2Vyouowoh7KjQdOhqW1k1m7mnm4ZgB6Wx0/WgLsjH5
	 8/MNtvGopchZxIYprcHnX7CuATGNgnrf8qz5D0qxsCFn1IV2W3HMGenT/lZUMKtngNwot
	 ElVGlE3eJlRbiyG2wrzrxDDZrHt6jSXV1modPGCXQzMo8QmTd7JX9eCOOvds/k6ZT7i9T
	 XxMH+lTNEkioeGk2O1hykhJtwXrfhnpsLCuI0gBsDAmkUBM9oyFIQiecGCSwTHZXkaXwI
	 hItjHX2Dq6FZiwuw84uPCFX/c/v/4N1tuhZ8Dh27J4aOi1OICCjxyvt4pts56x76cWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843601;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9Bo05cpBb2fnXNVbchOIBxTVjw9i9mFUDj/kOscdMPU=;
	b=lGLWkQPRE/dHySmsSr5WyblWVdEqdh4xaAWMkQE6JWasxl8bP0VQmQWuwaU67y5UC2wF
	 T+/eWmgSw1sS34SZAw/zV3FMZb6Hzi8kUPze6P/Q8auilVZ1nM+YyQDEMlLIFE8Apphm8
	 M+dz/P8PplbOnqxCDgtovtDSwDDKLt1lTvJr63SIyA1Eul0JjD4tfnFpf/SS3m9hWJxf0
	 NtOe5wJ77oEYmrWuMtrZ94kJ72FlBYXiyOe2P2ttRMcZMi6r7RRlhSNCdO1G2lo9p36Tf
	 113VfW5nDjH2N+H+eApYzdBQTf1fmanDJDxQpoKD9u/IrLublzE4oMUVV6AvQ/fOMbw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843601;
	bh=9Bo05cpBb2fnXNVbchOIBxTVjw9i9mFUDj/kOscdMPU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Eh56y1kBIws9CPecygmzyYVCle9gzL0FAfGwKZSADzKkxcAI8SZrSqWQsTWM5aXqE
	 Mz+burbw4O9evgITngXv6RTFrOk0jbhGM99JsCGBcZX89zpmkk6W/8HvvXboIJ1Rcb
	 GyAzuGLGc1iKRGdioWfyXNOjCsEZf1X/XyJKZweMRziPweSgjUUamfycJGf68Xya4T
	 Ro+joUb3ZxQ1Zf46LUxMwzaUu5ReBSYDJk/K9TPr4lkZG4KpBASpFzWk2Wa2sMbsWk
	 oWt0vRGM84ZNZFG1xUMjXVlgAIInYF/lFM+ORfkchxwPHKWqcvVphAyP2hE+llKwEJ
	 wt1uC0TN3bujw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3452060821;
	Mon, 16 Nov 2026 15:40:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73D9D2FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59F104078E
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WMWE-RDnVF5 for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:39:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D8FB04073D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8FB04073D
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:57 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4bb64ef5a00so11925105e9.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843595; x=1795448395;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=YgPskiGX+8sXxKV6tKteJ0qDtS2ifzJ/+TLvIh/AWBU=;
 b=CvJY5A3RBko+erkDbRJdocnca/rVURM2VunbTib99LyFy1yLdBEnu3rLPrCUKLQAH8
 FT2zi70QqlMSuIv9YEMEzl/u9wVXxwSY7/RmV1W5a2yoPLo+irg7hKPus0dbNW9k8RSx
 iEK/7bE2w7MRwNv1NX689azQ3FnBuHhReL5JkpVWE1hbgxWe4Nr31kp59FYK7H/vXpeE
 XBJH/EvJAl2FwXM5j1EGE9iio/rCH9ltyyo0WmBHaAfmtd8fp++8er/9k6JgakUmdoIY
 1q7jF7d9F1YdNFoZLxZ1TrR3BEEcWFY3zy8N78KE+VUkyAkuvtQgJkITFniX26ov1GRa
 YbGQ==
X-Gm-Message-State: APuU4Z/NFwYSSvyYY0zFUtUxkHSduVnOt1Y3Rxn76ms6mw/+vCoUJTQw
 KFyDAFfxDJwSu3nCUNzjhW7LT9Tn2qbQ51+Ys+zPz49qKhNHd97c9RWiNTFKL5cDCdvjumpjrep
 elUTn4ac=
X-Gm-Gg: AYBFou2nSaLneFYTTYFT09z9YJHyi+fUTTLX2dvGEPLfNBlkw12KmUL+NNVtxPUTBB0
 OMaqyUiD/2Cd8rG3nqrtHLIpI+78/Bib5V1FoCqoemUtp1OWpQMGPWpkjQB+durzIiWM1nf7I5t
 bg2EYBHOxbv/95kY7j4bHqhgl9qeFlCHmNhwyD3FJXO7bHdKCdcKUNQFeVM7RdqwQ7QJt4DpVS4
 lo+PWQs++wzlOwXxyUa86OO/jti4ox/5XSmJaNAsl3oHvF5EgEjzPnjn5MdGv4PPMdtr92UaHFY
 nPe474+DorgWayoFNfcklnUWwcuqE04hFRElYVanSOdr2SyaAsqEh3nlQl32lvKV0weXrZSARO0
 9jFufVw0aig/okyDVmrxHsEpOppD2AtD2uczurGMz9dsDZWhkQ9DKd+wDgkUYeDh/q7Ky7n4UmA
 0LiWXjwmGQpPinmdxTn8qeZOETacWCTsj1ANin7VpnvHFjM7EisTqp0wvFuJIeakFNGtkK8tV21
 2AePtgliscYjOtt/9FtMJSDwIwX2vUHXRp7+HJwvzvQ4lRDq8EInvvVWpoSrvMa0wIFMLcRuZPR
 EWzcBZWx3SD8R2kGTzs8tTGpJj8mv9A=
X-Received: by 2002:a05:600c:8b34:b0:4a1:702f:c736 with SMTP id
 5b1f17b1804b1-4bb55a25c0fmr217596305e9.3.1794843595547; 
 Mon, 16 Nov 2026 07:39:55 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5d22394esm23587577f8f.3.2026.11.16.07.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:39:55 -0800 (PST)
To: buildroot@buildroot.org,
 =?utf-8?b?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:39:52 +0100
Message-ID: <20261116153954.725651-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103091139.168897-1-raphael.melotte@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/perl-mozilla-ca: security bump
 to version 20261020
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gcmVwbHkgb2Y6Cj4gVmVyc2lvbiAyMDI2MTAyMCBkZW55bGlzdHMgdGhlIGVtU2lnbiBFQ0Mg
Um9vdCBDQSAtIEczIHJvb3QsIHRvIHdoaWNoCj4gdGhlIGNvbXByb21pc2VkIGVNdWRocmEgaW50
ZXJtZWRpYXRlIENBcyBjaGFpbiAoWzFdLCBbMl0pLgo+IAo+IENoYW5nZXM6Cj4gaHR0cHM6Ly9t
ZXRhY3Bhbi5vcmcvcmVsZWFzZS9MV1AvTW96aWxsYS1DQS0yMDI2MTAyMC9jaGFuZ2VzCj4gCj4g
WzFdOiBodHRwczovL2VtdWRocmEud2UtaGF2ZS1hLXByb2JsZW0uY29tLwo+IFsyXTogaHR0cHM6
Ly9ncm91cHMuZ29vZ2xlLmNvbS9hL21vemlsbGEub3JnL2cvZGV2LXNlY3VyaXR5LXBvbGljeS9j
LzBSM1hMSkw2RnVFCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhh
ZWwubWVsb3R0ZUBtaW5kLmJlPgoKQXBwbGllZCB0byAyMDI1LjAyLngsIDIwMjYuMDgueC4gVGhh
bmtzCgo+IC0tLQo+ICBwYWNrYWdlL3BlcmwtbW96aWxsYS1jYS9wZXJsLW1vemlsbGEtY2EuaGFz
aCB8IDQgKystLQo+ICBwYWNrYWdlL3BlcmwtbW96aWxsYS1jYS9wZXJsLW1vemlsbGEtY2EubWsg
ICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGVybC1tb3ppbGxhLWNhL3BlcmwtbW96aWxs
YS1jYS5oYXNoIGIvcGFja2FnZS9wZXJsLW1vemlsbGEtY2EvcGVybC1tb3ppbGxhLWNhLmhhc2gK
PiBpbmRleCA5ZTBiNmZmMTQyLi5iNWE1YjU3MGJjIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcGVy
bC1tb3ppbGxhLWNhL3BlcmwtbW96aWxsYS1jYS5oYXNoCj4gKysrIGIvcGFja2FnZS9wZXJsLW1v
emlsbGEtY2EvcGVybC1tb3ppbGxhLWNhLmhhc2gKPiBAQCAtMSw2ICsxLDYgQEAKPiAgIyByZXRy
aWV2ZWQgYnkgc2NhbmNwYW4gZnJvbSBodHRwczovL2NwYW4ubWV0YWNwYW4ub3JnLwo+IC1tZDUg
IGMxYWZiYTVmNGZlZjcxZGZlN2I2MzI4ZGRkM2MyNmQzICBNb3ppbGxhLUNBLTIwMjYwODEzLnRh
ci5nego+IC1zaGEyNTYgIDgxZjBiZDk2NjVlYWNiYjZmZWVmMTNiMGZhMTZmYmIzMDE2MmMwOTI5
MjU0MmIxMjA2NDM0ZTU2OTE5NmRkOWIgIE1vemlsbGEtQ0EtMjAyNjA4MTMudGFyLmd6Cj4gK21k
NSAgYzYyNzBkZTg2ZmU4OWVhN2QxYjI2YjQzYmFkOGM1ZjYgIE1vemlsbGEtQ0EtMjAyNjEwMjAu
dGFyLmd6Cj4gK3NoYTI1NiAgMWFlZWQ5N2E0NjMzODllNTgyZTA4NWU4MmRlMDNhZTBiZmZhZTc0
ZDQ2Y2Y4ZWU0YzUxMTM0MWU1NTA4YzIxZCAgTW96aWxsYS1DQS0yMDI2MTAyMC50YXIuZ3oKPiAg
Cj4gICMgY29tcHV0ZWQgYnkgc2NhbmNwYW4KPiAgc2hhMjU2ICA5NWNkNjNkYWU1YzJiZjZlN2Nm
MzM0MzU5ODE2MTRhMzZjODVlZjAxZmM3YTAyNDY0ZTA1ZTU4YTUzNTUzOThlICBSRUFETUUKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9wZXJsLW1vemlsbGEtY2EvcGVybC1tb3ppbGxhLWNhLm1rIGIv
cGFja2FnZS9wZXJsLW1vemlsbGEtY2EvcGVybC1tb3ppbGxhLWNhLm1rCj4gaW5kZXggYThjZmRk
NjZjNi4uNDAyMzM5ZDE4ZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BlcmwtbW96aWxsYS1jYS9w
ZXJsLW1vemlsbGEtY2EubWsKPiArKysgYi9wYWNrYWdlL3BlcmwtbW96aWxsYS1jYS9wZXJsLW1v
emlsbGEtY2EubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+ICAKPiAtUEVSTF9NT1pJTExBX0NBX1ZFUlNJT04gPSAyMDI2MDgxMwo+ICtQRVJMX01P
WklMTEFfQ0FfVkVSU0lPTiA9IDIwMjYxMDIwCj4gIFBFUkxfTU9aSUxMQV9DQV9TT1VSQ0UgPSBN
b3ppbGxhLUNBLSQoUEVSTF9NT1pJTExBX0NBX1ZFUlNJT04pLnRhci5nego+ICBQRVJMX01PWklM
TEFfQ0FfU0lURSA9ICQoQlIyX0NQQU5fTUlSUk9SKS9hdXRob3JzL2lkL0wvTFcvTFdQCj4gIFBF
UkxfTU9aSUxMQV9DQV9MSUNFTlNFID0gTVBMLTIuMApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
