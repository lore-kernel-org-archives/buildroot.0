Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5240A606A326
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 06:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WmCyFHwj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=NTNKlcSR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25225815D2;
	Fri, 20 Nov 2026 06:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QpuAediENmn; Fri, 20 Nov 2026 06:52:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5AE428159C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795157565;
	b=fr4UdEnHB4Hbr8kSy3fUM9ZK4sFKwcocHntchXS9XYs1nqWfmWUTVQP/cnMRUOMnqDld
	 a7ZNDLtykGtpmwOrCCt0kYTsiaG3dwYC9/o5KVBw9XeobyjtaBLEB2WOd8kAE39QkhtnS
	 FU4SsRUgZ9v2Zcj9FT7Io1qKytkB0JlfhzMg0EIoBFAUpjEjRys9xJ7OX8noJCLdo45C8
	 dRT70s1wDrvqUauAz4C0X0rZoLi3G4UbGFbgzwJXtVWf2Su4vYqX9idPsGOvcfstV+Ev6
	 p6wwAylqW6Nb5HC/US5NwUR1ZdYrBQeo0Jp6HO5+uReIrU9NcV1FNMSmyQxQ4xoa9GQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795157565;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=WW+e83W9wanEL9H9moxnTA4HyNIhVjiDi92q+gUE50c=;
	b=KtR4ZcowgC9rA5uCK8rwcn9dFESQ1/eLwIIqSOtobxCtGVVZNLxJY3GlaZiy5NWU0gKx
	 GyGL6hnHez9ipSOFouAc7Msysc3XSOhkJzLGAkDrb/LwxEYOw4l7wBeiVkHJkM3iWKjas
	 IWy3YrxNupdLuO/fb7N73pjISF3fqcJzmjvxAhU11IFiLrTaS0J5/ZfsuOnj4rZ1YUdrc
	 tqN4DueD6KWVFbNhEJfpGTBI9SvLN5wQwi9zoP3GqdOimy9g2i1iKhYsECfMZWnR7VNfG
	 t9akCsjyo4MJHpqvOh7wimNTCnmSz2U3VTOb91QujrsbuST1zshI928f9xNryx0xSnw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=NTNKlcSR;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795157565;
	bh=WW+e83W9wanEL9H9moxnTA4HyNIhVjiDi92q+gUE50c=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WmCyFHwjbeysrm2banmyxQM7xykiPAQ9F47SBTQLPrv0E+R7UJ1bwzxbtBu/RLEG8
	 KgLI1BhXtfz9tifVsW6Lnh59Aq4D3DEq+uVzrYRxeroFv39/8d7/TL8NYH07ZZmReH
	 i2saFA+BnkEjRS1zcxmjuTG+jZ1ZR91pZFuq7GTQniQlmkYC3ZXwoAzcLuCjeftxB9
	 NNe9AsVQuh6kHzghKOpNQ62jI/YUsvCnpKTsAnn5s704EjR2pbRwlFLOoQlplJPaix
	 H56GBTXo5XUouQc+CG77RGfXI7hHw6Fusn/Pq6DEbygLes/pl1kwuyK+fmFYjlVQ4O
	 B3hSFv+3Jlw3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AE428159C;
	Fri, 20 Nov 2026 06:52:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16A6C79D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13BE68159C
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_OKkjsw8W7M for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 06:52:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 104658156B
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:20::52f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=NTNKlcSR
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 104658156B
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:52:42 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6b8977f2785so788724a12.3
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 22:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1795157560; x=1795762360; darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+ajibTXFHqAp1D9DvL74ziAs3sSVdmdJhLzjMg4ohUg=;
 b=NTNKlcSRDvp/+ZRcS4h9hZctICtXrAT2P5mCSy+LtgKl2UFBPGZThKYf3hQlPv67SE
 hWepEs2J4meRwf56lTWJw29mwh2+/8hsWKr7bTQuHD+seercHM2+Zhmuzsq1TlVl0Beg
 3zklCVKcTloT7t7fuYgrSUqqa7+fUPBcNG6T+Tn+HinXHKAFbClH+ujFLVlej4l43V00
 VMqEJ1gZ0XWVA3vsAo7cYkGHUSrFreIwLaMFSzzTlVNkOXLhDdD1+YGU+5Xs5puk7NFg
 eHu6bNP2nJ67irpw4W+XhOd1tPn8NV3VI7kEHKUYyzAXcK0MWeSSC2FlQROcyfgLcIle
 Xbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795157560; x=1795762360;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+ajibTXFHqAp1D9DvL74ziAs3sSVdmdJhLzjMg4ohUg=;
 b=YYoUXw1f8YfJ1v60vEtw2w/YQ8IHvTvjfWllTh/oNGIE3ubvpKm/yGnyY+FSH0AdmK
 9gs669a/FY+uAfEq9ynvoLlJaysRua38rNnU3mfH6U8WCSZc83a13Pj5i7iH7KCt//xQ
 7V3VPEhv8BWKoPadCusO6oq+Dn781gSujsFqmvlnlwJ4AhQoVvYf6JxddH9WZX/3Fawp
 vMa0Pq1CFHhgLXH5ttOPpjYTXdhMLm1W0BONNODLUwpZ0b95lkB3+p+wIWTzDGjX9EYN
 Kg7Hwtu8DAzarlHsKMwyzw1PrQ36vG6ded2fZy7SadlZHE2c6cFH8E9Vf7RN1wZOQBd+
 ej6g==
X-Gm-Message-State: APuU4Z/URFjVfRbS2lZxwktNoYQzNF0fLMx5H1UzJodqwxyGdneTjShI
 3+jbKGPAA9zc7DEvt4CtOybjOmDfr1yD4J5yH1JmUMZXUVPmcuKGj1MqsJziZAlYco4i1qKCXLc
 3vgcLk374DxZNxg7vm7br862Gtd0Pzto=
X-Gm-Gg: AZFdTZdQtHT2e8r8xHMJEmg8Pl29FA+3GHLo0nIuSTS7a5Ggx3WT6Z9wryzq31Tt8Ak
 mrpwRheep3Tw0HybJM0W2F4/sHlBbcPKqsOu4+Kb1FysKgMR+U5Atv8cHheZQDuJSUUPAYj1wp/
 JjfEQ6Q6ZuJEn02H6EbjCmKSvToOJRheh1Y1J9Nbt5nHvURF7JX9TqLu8ija5AMJhiwSlJeOI8l
 RiMot5CbDC3ZU3PTtetdFR694uOyt155LkueMV+nS7uqBAtW7+Kc9vcSgz+5X1WbECqNSxHZY+G
 lMjaEgjf2dNGRXwY/AYapMYRB+75qk2ImNFCiAcf8+5A8MAPBoBeSqkFfJbB1yPXwxglGpmMxp5
 qN26p6mfPThu+T0z07+M76/L2lUYTbKHyx0Vjkw==
X-Received: by 2002:aa7:ca4b:0:b0:6b5:817e:4bd5 with SMTP id
 4fb4d7f45d1cf-6ba37d3de4amr921873a12.18.1795157560435; Thu, 19 Nov 2026
 22:52:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119080856.2471644-1-yegorslists@googlemail.com>
 <av_l_rKpCCtYRads@waldemar-brodkorb.de>
In-Reply-To: <av_l_rKpCCtYRads@waldemar-brodkorb.de>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 20 Nov 2026 07:53:09 +0100
X-Gm-Features: AclHuK9otv5EVjlfKvTibMeJm4abtpfQWBwSOaSYyxGoBsICzKEMZ9A1exCGmDc
Message-ID: <CAGm1_ktZy612TLzOgX=Z0oWbyct3F6gg3RhMhdRui167B9-81w@mail.gmail.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org, Etienne Carriere <etienne.carriere@foss.st.com>
Subject: Re: [Buildroot] [PATCH] package/optee-client: needs glibc or musl
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgV2FsZGVtYXIsCgpPbiBGcmksIE5vdiAyMCwgMjAyNiBhdCA3OjE34oCvQU0gV2FsZGVtYXIg
QnJvZGtvcmIgPHdieEBvcGVuYWRrLm9yZz4gd3JvdGU6Cj4KPiBIaSBZZWdvciwgYWxsLAo+IFll
Z29yIFllZnJlbW92IHdyb3RlLAo+Cj4gPiBTaW5jZSB2ZXJzaW9uIDQuOC4wIFsxXSwgdGVlLXN1
cHBsaWNhbnQgdXNlcyByZW5hbWVhdDIoKSwgd2hpY2gKPiA+IHVDbGliYy1uZyBkb2Vzbid0IHBy
b3ZpZGUgKGdsaWJjIGhhcyBpdCBzaW5jZSAyLjI4LCBtdXNsIHNpbmNlIDEuMi42KToKPiA+Cj4g
PiAgIHRlZV9zdXBwX2ZzLmM6NDkxOjI1OiBlcnJvcjogJ1JFTkFNRV9OT1JFUExBQ0UnIHVuZGVj
bGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ID4gICB0ZWVfc3VwcF9mcy5jOjQ5
MzoxMzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdyZW5hbWVhdDIn
OyBkaWQgeW91IG1lYW4gJ3JlbmFtZWF0Jz8gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRp
b25dCj4KPiBJbnN0ZWFkIG9mIGRpc2FibGluZyB0aGUgcGFja2FnZSwgSSB3aWxsIHByb3Bvc2Ug
YSBzbWFsbCB1Q2xpYmMtbmcKPiBwYXRjaCBwcm92aWRpbmcgdGhlIHN5c2NhbGwgd3JhcHBlciBm
b3IgcmVuYW1lYXQyLgoKVGhpcyBpcywgb2YgY291cnNlLCBhIGJldHRlciBzb2x1dGlvbi4gSSds
bCB0ZXN0IHlvdXIgcGF0Y2ggYXMgc29vbiBhcwppdCBhcnJpdmVzLgoKUmVnYXJkcywKWWVnb3IK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
