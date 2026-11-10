Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C920606A32A
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 12:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KEptrg4V;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xFnAJF8s
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CF1D80D29;
	Tue, 10 Nov 2026 12:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uE2SPsKxhnYz; Tue, 10 Nov 2026 12:52:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3A55080D2B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794315149;
	b=B9dqAR/KXpbmZ410/GjtP2yNO6bvCIxEb6cjjQdXzRliPBU9vKXgbFfMowKhInm67zrF
	 HBdg/PCx2vO0WETEl8cuASVzZoU5F8yciLS1n29I42FBlUdekeEL5IGD1CuiF6HuYxVPU
	 /4iBXNvaOqmYCWoAj8drmAJWjyVHQKMDUtes0FjR+Y//7y1vrcc88iG6NX4leg3CEtjm5
	 sG/Pd3O/eTt1LhQK0g89B/9be6d/w8GnWsG9bFo/xMKhlgKY1qh+fFRuyclWOw5lzPyH+
	 Aj2FgUgwofpI1lyhcP9/lodMJZ51csdAF+9q16JucrLkgPhtLse1md1mwXAJzAk7TIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794315149;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=4cUZi/w9WIJztkwKBEUvQ6m4o/FbJps+aC1ZaJNwhMc=;
	b=pEB8Yx0XrLa6ecHKsT+t3BOnIGZIHibQKZJi8SSXNPNrEeLyHdjcIHnIsMrfjK1aEq+9
	 H9438IM09NdHiRWdqNIUcl8zKTBeXWIKq/zao2pcImA81uwqzBG3MQLC3ZL1M1G6ZlJx2
	 1urEJ/obR5r5pMMPJCDLG/zEWb4inSVauU2FzbD/X8c50NR+pQKhoomCMo0jqXnWyFvez
	 OpEwkuFcbcr+sDgqSardYsbCsy9ou3eSORBc83fImgqNb9vaVbneS+v+zKP4kyZAC2wZP
	 lCH1Okwh2ch8NNJER5xgE2d+R2QappzjrQI8JIzC370oHcJ5VrO1qpVQRGzXmFB6UUg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xFnAJF8s;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794315149;
	bh=4cUZi/w9WIJztkwKBEUvQ6m4o/FbJps+aC1ZaJNwhMc=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KEptrg4V0S32FxJqxHMvEqTRMTcDeMJ2OFJL+IftaoeAp8ithkAMRX39bO9QIXLr0
	 T1VkjVgba9EmFrmAhmyx1nRddu07SYnFG7HEVwyXPQKiufbYeaQacRmXJ4MvvEhaCV
	 MoV5LFW3sgr+KEU3ZT/S5JvdQhVZmvgDpMkG9tK/aWtDCjVGFvlqKLuJro2bCV4rkw
	 dcR9DYyEOQMNqt/Pag77nXBOKP9uchPViB5cUGTLjG02ffdaK69nG/wBH7hSSq0hHh
	 41644/hE14+7baVY1YRdF9Ox5NnA37/x3WYRlOidBn29YcjyZCKAjY6yMMwTzcEz8A
	 ecta4dFBxZ53g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A55080D2B;
	Tue, 10 Nov 2026 12:52:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B20F9D1
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 12:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50FD380D2B
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 12:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUtvpLzIKHrA for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 12:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7B2F380D29
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::e2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2a; helo=mail-vs1-xe2a.google.com;
 envelope-from=softwarej@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=xFnAJF8s
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B2F380D29
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 12:52:26 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-7d2ee9e7093so631795137.1
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 04:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794315145; x=1794919945; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=x2AFe2m38KWC2O5N48i8p0OWCL3nUJJoBRGyT3HvXJk=;
 b=xFnAJF8szGU7Ldeeo75TibQKScSckFVDOYpt6jpk/7WjLN3qKqBT/gNVl4uwhC9pTO
 UHlgkHeGCfJZMucFtwTjEhkqn8kQxCZXwFtOVoNL9cPjsoWzmVRusYDGdmrCopo8+HN3
 wV2VDj3d5rKYF6TKObIhB5JLC0rn/REtZsojEpla3iguop9xxim6dtFGhtF0neXT70O3
 5JY+H7LZl+KNVh+wx2MSDBa6wBvKRoiBPazsygLCL5MmscGH6F/6LqAAPv04ozRvPv1i
 1yz98+rG/NiQUnoZ9AhX/PDedAL87aQP+8KkQKoesEyMODp1Vl8c8sxMffBN7nW9bRaZ
 POBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794315145; x=1794919945;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=x2AFe2m38KWC2O5N48i8p0OWCL3nUJJoBRGyT3HvXJk=;
 b=EdNoabbs21lmwjweylbqfuQZFmPsCYqUlOxw2W4Xg9bowSRH4DpVArfccDa798J4hN
 whqLvArZ3rL60MwYMW4udWLZezNx6c2qrBmEdvHh9UCz/vc3uDWlwSMwkos+RnPeme9B
 3Mb0LpsvHfKsyKBnZO4KBJ7h0jiGlT2jlVNfL+t31TFhcw+Cmutq2UpmY2xFnhadz2l9
 2Lck8PKDjQjPslD0PYEyskHU2FG9sLEg2vXcRgPKS5h4QeifOmRWFPvBrli96luSmA8T
 ZYI9ApvwHuyobwpWCwy7X4pcn/7lS4wYW3tjdt4pZhtSKDcgi9PGkP4dAHl8s/tyOAyi
 5+/w==
X-Gm-Message-State: APuU4Z/l/KpjKD93GhPhnXe8Kdg2otHxdNAqfdSEbQCz2sVxFEAy0MCm
 GRqDlYQEIPzMWolPK5aR/oucYUF5ZsM9bjXS4Ck6LJ3u6pNo1k7FIwiDL2bBYBmHWNkewhvbBAD
 VuGI51tuwKIrX1gH54Fh9tcK850uORqo=
X-Gm-Gg: AYBFou1ljU6Er8AHHSpYYwHDDg2+saI6fAFHYeE2Qq2jg/m3bh7mPZdK28avnhqsudy
 8n4Uu96syE6YqZkNHjQf7S+CIzcKqs2rx9gm0ebYxqDn8arFVHrZyJutyzleEvf30wb4+32amiV
 bvaDGGN5NiWNbCpFdtpnllf4Hke8TZorpR57KClyhoUwNg65aPzzW/3yMA3PBhHdlroVOaw8ZAx
 Nm25Mgpn3tSg6pK/20+lHlg4CloDM+qRjQusx2xlRb9YtJWKVrlrdkD3wuTM/6857hAGih9+c3P
 6x6l4Y4t3hCMDEOt3MURvK6JvKGojgII1j//1q3x07K0jcWkbmeED2GoJceIMPD3xUAQRH/x42s
 Kxm40AeOeW2Lk9hHEVEVlLyscwrDWenwJkZmg
X-Received: by 2002:a67:e103:0:b0:7cc:26e4:1943 with SMTP id
 ada2fe7eead31-7d301bf1816mr600890137.28.1794315144747; Tue, 10 Nov 2026
 04:52:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
 <20261107163414.560896-10-angelo.compagnucci@gmail.com>
In-Reply-To: <20261107163414.560896-10-angelo.compagnucci@gmail.com>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Tue, 10 Nov 2026 13:52:13 +0100
X-Gm-Features: AclHuK_WMHKQopc6eL2BP76Z_QDN_SMzyl3n5r028FBIPIAojoYro54acjKPaHE
Message-ID: <CAH+XeQbnB5H-NX=gaq3Vfu8=7C0no4bt6nw5k_BYcbhuQFPz8g@mail.gmail.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Subject: Re: [Buildroot] [PATCH v4 09/15] package/zfs: drop the unused
 module subdirectories
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 James Knight <james.d.knight@live.com>, Bernd Kuhls <bernd@kuhls.net>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RWwgc8OhYiwgNyBub3YgMjAyNiBhIGxhcyAxNzozNCwgQW5nZWxvIENvbXBhZ251Y2NpCig8YW5n
ZWxvLmNvbXBhZ251Y2NpQGdtYWlsLmNvbT4pIGVzY3JpYmnDszoKPgo+IFpGU19NT0RVTEVfU1VC
RElSUyBpcyBub3QgdXNlZCBzaW5jZSA0MTQ5M2NhZTcxICgicGFja2FnZS96ZnM6IG5vdAo+IHVz
aW5nIGtlcm5lbC1tb2R1bGUgaW5mcmEiKTogdGhlIGtlcm5lbCBtb2R1bGVzIGFyZSBidWlsdCBi
eSB0aGUKPiBhdXRvdG9vbHMgYnVpbGQgc3lzdGVtIG9mIHpmcywgYW5kIHRoZSB2YXJpYWJsZSB3
YXMgb25seSByZWFkIGJ5IHRoZQo+IGtlcm5lbC1tb2R1bGUgaW5mcmEuIERyb3AgaXQuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBBbmdlbG8gQ29tcGFnbnVjY2kgPGFuZ2Vsby5jb21wYWdudWNjaUBnbWFp
bC5jb20+ClJldmlld2VkLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpv
c2VsdWlzQGdtYWlsLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHYzIC0+IHY0Ogo+ICAgLSBuZXcgcGF0
Y2g6IGZpeCBhIGZpbGUgd2FybmVkIGFib3V0IGJ5IHRoZSBwYWNrYWdlIGluZnJhIGNoZWNrcwo+
ICAgICBhZGRlZCBhdCB0aGUgZW5kIG9mIHRoZSBzZXJpZXMuCj4KPiAgcGFja2FnZS96ZnMvemZz
Lm1rIHwgMTIgLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsK
PiBpbmRleCAwNzE1NTdiZjNlLi42YzIwOTM5ZGE1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvemZz
L3pmcy5tawo+ICsrKyBiL3BhY2thZ2UvemZzL3pmcy5tawo+IEBAIC02MywxOCArNjMsNiBAQCBa
RlNfTUFLRV9FTlYgKz0gXAo+ICAgICAgICAgQVJDSD0kKEtFUk5FTF9BUkNIKSBcCj4gICAgICAg
ICBDUk9TU19DT01QSUxFPSIkKFRBUkdFVF9DUk9TUykiCj4KPiAtIyBaRlMgdXNlcmxhbmQgdG9v
bHMgYXJlIHVuZnVuY3Rpb25hbCB3aXRob3V0IHRoZSBMaW51eCBrZXJuZWwgbW9kdWxlcy4KPiAt
WkZTX01PRFVMRV9TVUJESVJTID0gXAo+IC0gICAgICAgbW9kdWxlL2F2bCBcCj4gLSAgICAgICBt
b2R1bGUvaWNwIFwKPiAtICAgICAgIG1vZHVsZS9sdWEgXAo+IC0gICAgICAgbW9kdWxlL252cGFp
ciBcCj4gLSAgICAgICBtb2R1bGUvc3BsIFwKPiAtICAgICAgIG1vZHVsZS91bmljb2RlIFwKPiAt
ICAgICAgIG1vZHVsZS96Y29tbW9uIFwKPiAtICAgICAgIG1vZHVsZS96c3RkIFwKPiAtICAgICAg
IG1vZHVsZS96ZnMKPiAtCj4gICMgVGhlc2UgcmVxdWlyZW1lbnRzIHdpbGwgYmUgdmFsaWRhdGVk
IGJ5IHpmcy9jb25maWcva2VybmVsLWNvbmZpZy1kZWZpbmVkLm00Cj4gIGRlZmluZSBaRlNfTElO
VVhfQ09ORklHX0ZJWFVQUwo+ICAgICAgICAgJChjYWxsIEtDT05GSUdfRElTQUJMRV9PUFQsQ09O
RklHX0RFQlVHX0xPQ0tfQUxMT0MpCj4gLS0KPiAyLjUzLjAKPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
