Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2B1E95392
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 12:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01B5C60ABB;
	Wed,  4 Feb 2026 12:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ltHTyBGRRREe; Wed,  4 Feb 2026 12:55:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4E25608A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770209722;
	bh=HriG3JPWZ2m3RsyYmXLX39Hk3KALRkQ+fZ/z8PPBNLk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=babUi+j9YIeZqmKhMSXlyjv4aCrzJ04JiVGq1O+4tPXGcEd78YOr4jf8+kXdoz5e9
	 8RDd4hwdWMhMyOXqhUoxNw1SgtAnYfu5H5CH4yCWm7MTuQh37bGSXj6tH2dj6OZrGo
	 DGUqRNHFxOolspey0y/YQpM/mwStpmpseQ9F3j20VO+uKSuOqMviA9mgNR0xswhrqu
	 mNG4LH6tECp3PpzTydCpA30hAZiTHnrrX85OEp7uxj+2ldMSwMjVMI4lXndkHkttgV
	 Bb3OusGYSEKgUUmMM9nW1tZW9TTZZUXOkdhTX0Kr58K86plfKI9DvjKPPxhsQFIn9o
	 UUyKI+ukIO3bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4E25608A3;
	Wed,  4 Feb 2026 12:55:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 218ADF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C52D40363
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2t-gU3xIsW9E for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 12:55:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A6838400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6838400FB
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6838400FB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:55:19 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so6293227f8f.1
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 04:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770209717; x=1770814517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ahfa3gLg0uNRv9TKNWucl5caLPJknmYwlGruYhyZMEw=;
 b=LNVBbAmMsGfTNNQkRZ51hqBtARsPrq4GwTIW5H5HmbOrNW/J8lRVq9nI0aVgzpLAHK
 HrziSOhRTbw++gvp3n1OYRQUEBgpplosNRA00lPv5Itp60Y3aaTinrjQQDXSja1ZCmYE
 o9Nd04ETvqNvAHwiWM/720Db+09/MYHStwBH27ZPn/1VZt4ev5sxBQKNqtY/UN6tuLUQ
 s3kBZEH/rJzg3ZUn8xGq093WU2Zo914YoZ4KuSM5YR/gDSNDJ2b6oMJ7r6dlrinVdToQ
 V6Z8zA4nzoarJog+E7Ys/WCvQIRXZe3owNvAnhekwFCAyvYNhsm8rIuTqf8TPlA8v4vt
 gjtw==
X-Gm-Message-State: AOJu0Yw1+Dz2tk6VaqK07NN5/fVt3WpB8plAYZy4j5fcSo36FFizZeB1
 ToFugUmOIuZxlZ2LoAuHZiCqZDTPvwSF6d9x0u3ZDZVX3VVPMMYIJ5gBtfu2
X-Gm-Gg: AZuq6aJVknJJnQH6JCoGWWbNFEd0fHY7zX4qPCkBpt1OjaUplEDpgRjoQvjpHzCZSaL
 qx4Dx518FeF+G9qJlY2IEL80Ply9LbEthmNL+E8+BFy23EMmVwIuG2xGTmTipX7cVxd+Ommuez8
 bNlbdvH1g4OViN9JVjPCjoZxliKgANnqsmC6ojn2MhkKpcGVANg2+dQLEqtlPD8LFhdtmdBkQeX
 W0CLKkLBjI3Z66g/q2fM2PVkTVFUsjAe6Yn00KrKtlhDuiJHL4OZd9HuevahcKkLWdGU5SKgvwt
 F5Ou4L4Bo+vCHbgM1D5jNrBD3gzThBOYMX5sJG9rS/xGWQQS5vwN0P75OkIsCKY3SxyMkxIZt2j
 VuRSHXoBM5FIfY4h2E0QMG4ykH0NYiHnpN59drjmZOx7mxxi4Ml0eJcjzlUXTLgkTgHMxEqtUXh
 0XEnwL728eX9V8U/mif07raVKNs8/t34FA2Ryw
X-Received: by 2002:a05:6000:2309:b0:427:23a:c339 with SMTP id
 ffacd0b85a97d-43617e40984mr3927018f8f.14.1770209717012; 
 Wed, 04 Feb 2026 04:55:17 -0800 (PST)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e3a546sm7277662f8f.17.2026.02.04.04.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 04:55:16 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: elmehdi.younes@smile.fr,
	romain.naour@smile.fr,
	shirokovalexs@gmail.com
Date: Wed,  4 Feb 2026 13:55:14 +0100
Message-ID: <20260204125515.313042-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <03a36d81-cffd-4593-b03e-e8831d8e3e0b@smile.fr>
References: <03a36d81-cffd-4593-b03e-e8831d8e3e0b@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770209717; x=1770814517; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ahfa3gLg0uNRv9TKNWucl5caLPJknmYwlGruYhyZMEw=;
 b=GlpYrQg/gsXfX2TRmlj6yvfJ8vrHhkOymzXL8k1hD5x5iqrEnZrNaZtk3q/0N7w2to
 i98A2mGINLZazVvRFmRfZ7UNgu91wxwvMvl+UdvjA2MhdLksFGkvkwCt9vGolSCh3+ow
 xY1xF17/54NZPhGMaxYHGu2uXGG2dVbjf8xESv2xvvJ20jx4cJ4kEQ5C0ji7xi2tslEQ
 WMDdhId42OR13HMqJSP1XSyattcxJZI/drvAELp9r1B3mqLYKAd7l3+cc0v++3nh+psE
 JOQXMnJJ/ZxnyWPhcd49VQ6eNv9SMgWR7eAepMy39Ip1+ZGiqD8atr/3YTmon5YvoHBh
 dOYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GlpYrQg/
Subject: Re: [Buildroot] [v7, 1/2] package/uutils-coreutils: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sIFJvbWFpbiwgQWxsCgpUaGFuayB5b3UgZm9yIHJldmlldyBhbmQgY29tbWVudHMuCgo+
IGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfQlVTWUJPWF9TSE9XX09USEVSUwo+IAo+IFRoaXMgYWRk
IGEgZGVwZW5kZW5jeSBvbiBidXN5Ym94IHBhY2thZ2UuIFdlIG1heSB3YW50IHRvIGluc3RhbGwK
PiB1dXRpbHMtY29yZXV0aWxzIHdpdGhvdXQgYnVzeWJveCAoZXZlbiBpZiBCdWlsZHJvb3QgdXNl
cyBidXN5Ym94IGJ5IGRlZmF1bHQpLgoKVGhhdCdzIGFuIGludGVyZXN0aW5nIHF1ZXN0aW9uLiBJ
J3ZlIGhhZCBzb21lIGRvdWJ0cyBhYm91dCB0aGUgZmxhZyB0b28uIEJ1dC4uLgoKMS4gcGFja2Fn
ZS9idXN5Ym94L0NvbmZpZy5pbiBoYXMgc3VjaCBjb21tZW50OgoKCSMgVGhpcyBvcHRpb24gaXMg
bm90IGFuIG9wdGlvbiBvZiBCdXN5Ym94LCBpdCBjYW4gYmUgc2VsZWN0ZWQgZXZlbgoJIyBpZiBC
dXN5Ym94IGlzIG5vdCBlbmFibGVkLgoJY29uZmlnIEJSMl9QQUNLQUdFX0JVU1lCT1hfU0hPV19P
VEhFUlMKClNvLCBpdCdzIHBvc3NpYmxlIHRvIGRpc2FibGUgYnVzeWJveCwgYnV0IHNlbGVjdCB1
dXRpbHMtY29yZXV0aWxzLgoKMi4gVGhlIGZsYWcgaXMgdXNlZCBieSBjb3JldXRpbHMgKGFuZCBt
YW55IG90aGVyIHBhY2thZ2VzKS4gU28sIEkgZGVjaWRlZCBpdCdzCnZlcnkgcHJvYmFibGUgc2hv
dWxkIGJlIGhlcmUsIHRvby4KCgo+IENhbiB3ZSBvYnRhaW4gdGhpcyBsaXN0IG9mIGJpbmFyeSBi
eSB1c2luZyBhIHNtYWxsIGNvbW1hbmQgbGluZT8KPiBJZiBzbywgeW91IGNvdWxkIGFkZCBpdCBp
biBhIGNvbW1tZW50IHRvIGhlbHAgZnVydGhlciB1cGRhdGUgb2YgdGhpcyBsaXN0LgoKWWVzLiBN
b3Jlb3ZlciwgRWwgTWVoZGkgWU9VTkVTIGhhZCBhbHJlYWR5IHByb3ZpZGVkIHRob3NlIGNvbW1h
bmRzIGVhcmxpZXIuCgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL2NvbW1lbnQvMzUzNjE0
NS8KCk9ubHkgb25lIHJlYXNvbmFibGUgcXVlc3Rpb24gaXMgV0hFTiB3ZSBzaG91bGQgY2FsbCB0
aGUgY29tbWFuZC4gSXQncyBwb3NzaWJsZQp0byBjYWxsIHRoZSBjb21tYW5kKHMpIGR1cmluZyBl
ZGl0aW5nIGEgTWFrZWZpbGUgYW5kIHN0b3JlIHJlc3VsdHMgZXhwbGljaXRseSwKb3IgY2FsbCBp
dCBkdXJpbmcgdGhlIGJ1aWxkIHRvIGdldCB0aGUgYWN0dWFsIGxpc3QgZHluYW1pY2FsbHkuCgpC
b3RoIG1ldGhvZHMgd2lsbCB3b3JrLCBidXQgaGF2ZSBkaWZmZXJlbnQgcHJvcyBhbmQgY29ucy4K
CkZvciBleGFtcGxlLCBydW5uaW5nIGNvbW1hbmRzIGR1cmluZyBNYWtlZmlsZSBjcmVhdGlvbiBh
bGxvd3MgdG8gZXhwbGljaXRseQpjb250cm9sIHRoZSB1dGlsaXRpZXMsIGJ1dCByZXN1bHRzIGlu
IGEgYmlnZ2VyIE1ha2VmaWxlIGFuZCBtb3JlIG1hbnVhbCBzdGVwcy4KCkdlbmVyYXRpbmcgYSBs
aXN0IG9mIHV0aWxpdGllcyBkdXJpbmcgdGhlIGJ1aWxkIGFsbG93cyB0byByZWR1Y2UgdGhlIHNp
emUgb2YKdGhlIE1ha2VmaWxlIGFuZCB1cGRhdGUgdGhlIGxpc3QgYXV0b21hdGljYWxseS4gQnV0
IGl0IGNvdWxkIGxlYWQgdG8gYWRkaW5nIG5ldwpiaW5hcmllcyBpbiBhbiBpbXBsaWNpdCBmb3Jt
LgoKRnVydGhlcm1vcmUsIEJ1aWxkcm9vdCBtYXkgaGF2ZSB0eXBpY2FsIGNvbnZlbnRpb25zIG9y
IHByZWZlcmVuY2VzIGFib3V0IGhvdyB0bwphY3QgaW4gdGhpcyBjYXNlLgoKSG93IGRvIHlvdSB0
aGluaywgd2hpY2ggd2F5IGlzIGJldHRlcj8KCj4gRG8gd2UgcmVhbGx5IG5lZWQgJzo9Jz8KPgo+
IERvIHdlIHJlYWxseSB3YW50IHRoZSBCdWlsZHJvb3QgdXNlciBhYmxlIHRvIGN1c3RvbWl6ZSB0
aGlzIGxpc3QgZnJvbSBLY29uZmlnPwoKVGhlIG1haW4gcmVhc29uIGZvciBkb2luZyBzdWNoIGNv
bmZpZ3VyYXRpb24gaXMgbWlncmF0aW9uIHRvIHV1dGlscy1jb3JldXRpbHMuCkFzIHRoaXMgYXBw
cm9hY2ggYWxsb3dzIHVzIHRvIHJlcGxhY2UgdXRpbGl0aWVzIG9uZSBieSBvbmUgYW5kIG1ha2UK
dGVzdHMvbWVhc3VyZW1lbnRzIHRvIGNvbXBhcmUgdGhlIGRpZmZlcmVuY2VzLgoKRnJvbSB0aGUg
b3RoZXIgaGFuZCwgdGhhdCBjb3VsZCBiZSBhIHJhcmUgY2FzZS4gRXNwZWNpYWxseSB0YWtpbmcg
aW50byBhY2NvdW50CmNvbnN0YW50IGltcHJvdmVtZW50cyBmcm9tIHRoZSB1dXRpbHMtY29yZXV0
aWxzIHNpZGUuIEFuZCB1c3VhbGx5IHBlb3BsZSB3aG8KbWFrZSBzdWNoIGtpbmRzIG9mIG1pZ3Jh
dGlvbnMgYXJlIGV4cGVyaWVuY2VkIGVub3VnaCB0byBwcmVwYXJlIHRoZWlyIG93biBmaWxlcwpv
ciBtYWtlZmlsZXMgd2l0aCBzbGlnaHRseSBjaGFuZ2VkIC8gaGFyZGNvZGVkIHZhbHVlcy4KCkdl
bmVyYWxseSwgSSdtIG5vdCBvcHBvc2VkIHRvIHNpbXBsaWZ5aW5nIHRoYXQgcGFydCBhbmQgcmVt
b3ZpbmcgdGhhdApjb25maWd1cmF0aW9uLiBXZSBjYW4gYWRkIGl0IGJhY2sgaWYgd2UgaGF2ZSBz
dWZmaWNpZW50IGV2aWRlbmNlIHRoYXQgaXQncyB0cnVseQpuZWVkZWQuCgo+IFdoYXQgaWYgdGhl
IHVzZXIgcmVxdWVzdCBhIHRvb2wgdGhhdCByZXF1aXJlcyBhbiBhZGRpdGlvbmFsIGRlcGVuZGVu
Y3kgb3IKPiBzcGVjaWZpYyBoYW5kbGluZz8KCkJhc2VkIG9uIG15IGV4cGVyaWVuY2UsIGl0IHdp
bGwgbGVhZCB0byBhIGZhaWxlZCBidWlsZC4KCj4gSWYgd2UgY29tcGFyZSB3aXRoIG1ldGEtb3Bl
bnBhY2thZ2luZywgd2hhdCBhYm91dCBjaHJvb3QgdXRpbGl0eSB0aGF0IGlzCmluc3RhbGxlZCB0
byBzYmluIGRpcmVjdG9yeT8KClRoYW5rcy4gSSdsbCByZWNoZWNrIHRoaXMgcGFydC4gU2VlbXMg
SSBmb3Jnb3QgYWJvdXQgdGhpcy4KCj4gRG8gd2Ugd2FudCB0byBlbmFibGUgZmVhdF9leHRlcm5h
bF9saWJzdGRidWYgdG9vPwoKSeKAmWxsIHJlY2hlY2sgYGxpYnN0ZGJ1ZmAgYW5kIHRoZSBhYmls
aXR5IHRvIHVzZSBhbiBleHRlcm5hbCB2ZXJzaW9uLiBJbiBnZW5lcmFsLApJIHJlbWVtYmVyIHRo
YXQgYGxpYnN0ZGJ1ZmAgbGVkIHRvIHNvbWUgYnVpbGQgaXNzdWVzIGluIHZlcnkgZWFybHkgdmVy
c2lvbnMuCkUuZy46IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvY29tbWVudC8zMTkwNjU0
LwpCdXQgSSBkb24ndCByZW1lbWJlciB0aGUgZGV0YWlscywgc28gaXQncyB3b3J0aCB0cnlpbmcg
LyBjaGVja2luZyBvbmNlIGFnYWluLgoKPiBTb3JyeSBmb3IgdGhlIGRlbGF5IHRvIHJldmlldyB5
b3VyIHBhdGNoLCB0aGUgb25seSBhbm5veWluZyBwYXJ0IGlzIHRoZSBpbnN0YWxsCj4gcHJvY2Vz
cyA6LS8KClN1cmUsIG5vIHByb2JsZW0uIEknbSBub3QgaW4gYSBodXJyeSB3aXRoIGl0IDopIFRo
YW5rIHlvdSBvbmNlIGFnYWluIGZvcgp5b3VyIHJldmlldyBhbmQgaW5mb3JtYXRpdmUgY29tbWVu
dHMuIEknbSBnbGFkIHRvIHJldHVybiB0byB1dXRpbHMtY29yZXV0aWxzCmFjdGl2aXRpZXMuCgpS
ZWdhcmRzLApBbGV4YW5kZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
