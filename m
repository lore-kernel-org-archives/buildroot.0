Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4D6EC1EB9
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 13:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6F0C60C2E;
	Thu,  5 Feb 2026 13:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyETBXRjBD-N; Thu,  5 Feb 2026 13:50:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC18760D9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770299449;
	bh=//M8Yedl8+hy9/dQTFTyJFvgbqdf5TpQ4FQUcTIRnkY=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YCzxOUvmLeRUnh8eRmecIW2kqjdg1XtMhJbDLamzWO9pV3F2FGyM7q6Sd2Xhq+7lQ
	 qvjK1sWdwZiuYtqLm6ACs6/AusyjH3WfejtTVPAcZJ3iBZR34vx0aC+IV8gdKUtnpD
	 qAXhDU0mxjz8crmx0XAY4FeTimn/XnLHEPhVyzupcvatpHtUeGoE21vXvRQBIf5eGT
	 R73PcN0O8PemMoMzPhPNAzvNDFqpQC3er7BBfZVORN2ooYxztpS6G+66Y73ZhsUlaZ
	 aO3wMK6wZkNsY+J78DN4iSpY80K9r8kUiiWsQr+jpIy5gLrweWLRVh4fa7LryclAOq
	 PHXUmAUvm/cWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC18760D9B;
	Thu,  5 Feb 2026 13:50:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85B1F173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 13:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FE6D60DB2
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 13:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JeDjWvkwTbui for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 13:50:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=laurentiumihalcea111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C0E960C2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C0E960C2E
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C0E960C2E
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 13:50:46 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso8845285e9.2
 for <buildroot@buildroot.org>; Thu, 05 Feb 2026 05:50:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770299444; x=1770904244;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=diTh/eXyXKvpnE49iArJooucuye/aySx6oJVhZ2rXfU=;
 b=PdBMbpf2pucdeeQjP04Mse9UZSEjzo1wE3C39RBzdbX9H9p2sdAFJS8NOTHE3o61Q7
 B9JJtKBPPs0Bz/Ek6OFNeCeQ2TuF0dsdvbxCJMotWEs9xbwylz3qVoMs+CiuKd2blEGk
 mlWzzVrfXrpfhmeZYzZwy1wD4fgqYcY9pJ5W1RH1xkS9ryQCc9Q/TAVktV3FhZ1d3WrH
 69RtBTf7lV+QqC9xZBQcHu5e83Z81lu+qw1+I0mswh4+zME328YqswA0dA16dB20SwtQ
 kJhhbtFco25GD5Jwrrdt6WQTi6wz2oqkhVeddxQ30ZY1Hn9wGLdFDdBdArx9Byu1g54i
 C24g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUD2Sf9Wtwh/puElkzTQvcCv961L9BLOeeFiG04fE+PyeIPqHU7VrisOgQqUJbWt8MHJro/SU4pVw=@buildroot.org
X-Gm-Message-State: AOJu0YypsEbYAV/hyRTwi9jpDPGokSSl8Icf3A0JdqcHDaDKm9vmY8CR
 2sp/v2+fGfJVshkwqlIGXQ3n6cS6FrfkHDGG/c8PssDkNPXnKBpk4B6AI0pqbg==
X-Gm-Gg: AZuq6aLrJtWnI78UtXeguKAdEz38MX7T/6v+3zskPGrUJGrbRJh4LZ5JNeoD3nSedFx
 uCSIOud0gvlPWFNL6sRNvdHCdbZ/XgcQ2h49s8d/2WJoWk3G+gPjHEFPNxWqeOMUbvRvjhaw2MZ
 6Yng4Olqr5H/yU1im5sSFgQ0xKS2LHDO8tdRpE15cbKXsyYi+wb/kufs6P+smS6CC0BzEf0yWVX
 yhqPbvBXbefaRWyDcJC/oARk6NXsjazz3wN3vyZ/uwwZ+TUNUt3sjJmnT1tJsDcj7Ku2EiK+sf0
 2/nEFkmHEgF9PctN/9JV/mMkuwx37/9Z83K62mHiTov6ppdyXrk6lE6J8d8q+32E/wA4LK5t5qq
 nejSBkCrmOXZCY17At2wRYDGPNV7D3Uprq1BdUuFP5klXV6l+iriQxuA/ANjvpttTptFCQ0eSJg
 giR7J/NpfrTgipFR/9bhYNuBNUHfzLpV97S+nqATnq4YtV
X-Received: by 2002:a05:600c:1914:b0:47b:deb9:f8a with SMTP id
 5b1f17b1804b1-4830e9862cbmr90996155e9.30.1770299443784; 
 Thu, 05 Feb 2026 05:50:43 -0800 (PST)
Received: from [10.25.211.197] ([128.77.115.157])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d20324sm51870715e9.3.2026.02.05.05.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 05:50:42 -0800 (PST)
Message-ID: <03a314f3-b029-48e7-993e-765f0b7b97cd@gmail.com>
Date: Thu, 5 Feb 2026 05:50:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
References: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
 <981f9938-a716-40fe-9e02-af9fd84ac8f3@armadeus.com>
 <fa075240-a629-4f07-87d5-717c8dcca539@gmail.com>
 <e2a9dfc8-3b0b-4397-b453-76c88ca2a781@armadeus.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <e2a9dfc8-3b0b-4397-b453-76c88ca2a781@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770299444; x=1770904244; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=diTh/eXyXKvpnE49iArJooucuye/aySx6oJVhZ2rXfU=;
 b=bhZXRvzyD59zkjNjTH/JA49j7O0nvlAPYshyYYiU7NFDrrHK+R0RkRZXYqi8gl1kY4
 WA0ZxxPizjOO8J6FnhW4hPw/MQirV9je9+8bRe/XXjmbHLonUIaolk7LlkW6xOqSu0qG
 lALob5Lz+W9Isr6xdlNAsitdPJgacm2DNnJ9xY51OQEGND3lgO1gU7v9IL0UYNYj7uWY
 uSJAKqf/NouOgDMcUVhhGii8NQTFsH5teu43oDISf44KHFWm3W+L4l0lMkYUXjH7+4Cy
 mqC5UMISAJacQnUNmq/1I21YjHyJMnqXsslzl2RfIoWrTn6TcVzuoiXJsskmc5BNsnHR
 Ppcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bhZXRvzy
Subject: Re: [Buildroot] [PATCH 00/10] Add support for IMX95-15x15-FRDM board
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

CgpPbiAyLzUvMjAyNiA1OjI4IEFNLCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBIZWxs
byBMYXVyZW50aXUsIGFsbCwKPiAKPiBPbiAyLzMvMjYgNTo0MCBQTSwgTGF1cmVudGl1IE1paGFs
Y2VhIHdyb3RlOgo+Pgo+PiBPbiAyLzMvMjAyNiA1OjUyIFBNLCBTw6liYXN0aWVuIFN6eW1hbnNr
aSB3cm90ZToKPj4+IEhlbGxvIExhdXJlbnRpdSwgYWxsLAo+Pj4KPj4+IE9uIDIvMy8yNiA0OjM2
IFBNLCBMYXVyZW50aXUgTWloYWxjZWEgd3JvdGU6Cj4+Pj4gRnJvbTogTGF1cmVudGl1IE1paGFs
Y2VhIDxsYXVyZW50aXUubWloYWxjZWFAbnhwLmNvbT4KPj4+Pgo+Pj4+IEhpIGZvbGtzLAo+Pj4+
Cj4+Pj4gVGhpcyBzZXJpZXMgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBOWFAncyBJTVg5NS0xNXgx
NS1GUkRNIGJvYXJkLgo+Pj4KPj4+IE5pY2UhIEkgd2FzIHdvcmtpbmcgb24gYWRkaW5nIGkuTVg5
NSB0b28gYW5kIGp1c3Qgc2F3IHlvdXIgcGF0Y2hlcyEgSSB3aWxsIHRyeSB5b3UgcGF0Y2hlcyB0
aGVuIQo+Pgo+Pgo+PiBUaGFua3MsIGxldCBtZSBrbm93IGlmIHlvdSBoYXZlIGFueSBmZWVkYmFj
ayA6KQo+IAo+IEkgd2FzIGhvcGluZyB0byBiZSBhYmxlIHRvIHRlc3QgeW91ciBwYXRjaGVzIG9u
IG15IE1YOTVMUDRYRVZLLTE1IGJ1dCBpdCBoYXMgYW4gaU1YOTUgQTEgOi8gSXQgbG9va3MgbGlr
ZSB0aGUgbGF0ZXN0IHJlbGVhc2UgKExGNi4xMi40OS0yLjIuMCkgb25seSBzdXBwb3J0cyBCMCwg
cmlnaHQgPwo+IAo+IFJlZ2FyZHMsCgoKSGV5IFNlYmFzdGllbiwKCkNhbiB5b3UgcGxlYXNlIHRy
eSB1c2luZyB0aGUgZmlybXdhcmUgKE9FSSBhbmQgRUxFKSBmb3IgQTAgcmV2aXNpb24/CkkgdGhp
bmsgdGhlc2Ugc2hvdWxkIGJlIHRoZSBvbmx5IGJpbmFyaWVzIHJlcXVpcmluZyBhIFNPQyByZXZp
c2lvbi4KCkkgYmVsaWV2ZSB0aGVyZSdzIG5vIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgdHdvIHJl
dmlzaW9ucyB3LnIudCBPRUkvRUxFCndoaWNoIGlzIHdoeSB0aGVyZSdzIG5vIGZpcm13YXJlIGJp
bmFyaWVzLCBidXQgcGVyaGFwcyBJJ20gd3Jvbmc/CgpVbmZvcnR1bmF0ZWx5LCBJIGRvbid0IGhh
dmUgYW4gTVg5NUxQNFhFVkstMTUgdy8gQTEgb24gaGFuZCBzbyBJIGNhbid0CnRlc3QgdGhpcyBt
eXNlbGYgOigKClRoYW5rcywKTGF1cmVudGl1CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
