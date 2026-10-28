Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3FB606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 10:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=htoi6knV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UA7sdfsz
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB61980EB3;
	Wed, 28 Oct 2026 10:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4T7J4iFutW0; Wed, 28 Oct 2026 10:32:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 05D2680E12
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793183578;
	b=Aj3qws/GtGnaEAayNClCkTJa+bQ/MAWnf8ou+bYDoK0BDbzJ+yq9Z/vBGG6L2T0QbVjD
	 mWuvgT29pES5Vu+rhfjcVqTPA02cWFqQ6O8l+hCvTd2WOzD5XTmt53vHLH+H9gNs7xmk8
	 k961RL+uLvNeMSavoiou3I70NVopaStqP1Zu2XkF0EXMjO1+xczf1aVSBDOwnyJ027aYy
	 9dPgtJ+jDkCdDGKATMIY58zeeW69vGvetplGqS2K6INBjDEOhlCT0AoAkkt8vR75J91fl
	 9gxcDn0XAYxdNm31LhsS21patEinHAHyc9HIn/+jj5w3GAgjvyYNsOV0ntjS1krlEnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793183578;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Organization:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SSb+Ra0Zbg7+IjNjX6mBJnVvVnpI7WbLBMmwUIrClmI=;
	b=BYjlMdS3W1Ybjy1pckctr4pVCIf+S38UBjV1aZJX9t6LJvnZP3aGBOo26T5Ls0oPhHuG
	 hmm7lVIIZGsWuoZtsXTxNlrdDJfOrmkduVzUXjNLdtGwDUyLsw2vF2tYbGw1WOS7753YG
	 i/fmx97XbRjNB4ZsEpWbTqY8ELQC/dB4mytqWtKYtoCc4MNPm3mnAf/mQ6SplAHF29Lpp
	 VCyr3mJKPAczQGWjMtfnbKpGc507VcUUtQK0b0O2zNDgfyapyf7t7WCeLoV5r/81hnxHD
	 xrt1IDsvs79AOVpykkfFPMqwzdSAMVwvPJpRdvyZveeQXqjg+nXu/3IjUb6N2z9fUWQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793183578;
	bh=SSb+Ra0Zbg7+IjNjX6mBJnVvVnpI7WbLBMmwUIrClmI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=htoi6knV5xtKhlOAHj0JSkJsOWPM/6PJzSPQCwezMugyVUCm8roFwSRVhoKfjytqQ
	 ackr79fMjn2TSqh+MBk59Z76LvEn6E75BC57ayYewHvQGwTTuRdkvKs9hl3sH4oOeQ
	 pZ1xXLoNkhROUktG5A6hRBMTQvQTtA9jJMS0yRA7XxTXx6N2jx3yBXkO8OAOjZer2b
	 nv6J65KSJmUZrhK22UN40UNuGbADzKYc6ALHLfrzJpSyFMxvxSQFB9wpXWPm2URBdE
	 TgV1aQ0/8L2H0VV87hPmndH2125g1j16VwUu5hcn1SfB9E0exEZHD7TXr9Q1UhRpc3
	 F4yFG+ox/27Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05D2680E12;
	Wed, 28 Oct 2026 10:32:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00D53356
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 10:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAB9D40567
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 10:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRBC4_w4TF0W for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 10:32:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0385740565
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::536"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793183576;
 b=Xp3a6AFzNYFkO6IOXRXznv6Hgz1Yu3bMPcS/DATrSWCoRTiOsh4EVWxFeBNsttTjrX8t
 O46Njby0gSOADVRCWu5tlFNsHH2sQoFxSVWa9wp4MhL8tzcXMR+7oe8nHTzWHvlV/ewif
 pV+y9BeUE6nnSYU2RkbqBkRTeEMNMAHqbCL7mVbzKJjr3CgBAloq47vpdatHbp4QFh4UY
 m9DD4FJwBNms2hv8YOQBFT0XelJOe4K1iriQ5ulX4JSIE2VhyGei2Vye0tYVhyKmdw7IE
 6MJoIaXr5Bee3dMybsGTUDdH587d9iGfsmWAEDf5f7eu+h81vy6a81DkdoQa1gq8Z+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793183576;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:Organization:
 Content-Transfer-Encoding;
 bh=HBUkYl24vfkDuWwJ0TzTP9FRWA5PS8uTf+Bi8W6xGho=;
 b=goaba70399q+KkG5DYmmNz1vzVltA4gm8q8eioI1Mj9zUkw1D+TcfrCSoMGS5tWdsODh
 ypwXqHHmrhp0AFLzyyjX7JzXAt1/ZmsPNstQTPB6ZRlwWS3rsgT7Jk1CinmoxAwNx1Tl3
 DO6BMpOPoPW+dy+VSJEeoPG06wy0uNkSaz4vdu3t3njVsyVHTnJZE4cpH9xKDNTYamtoN
 YOq96WldOhEMf01gMlYwohXoGhsVJVQTHQyDQxrXd9V/NJ9XEiWJz9/s7AnQGoUWH7i2C
 o8+hAYv4HWB9UfT72QIaNR+T54Uy6LEB2m2oCU07iCMfVbW/Ok/IjexxYEQmoJ+ioYw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=UA7sdfsz; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::536"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=UA7sdfsz
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0385740565
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 10:32:54 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6acb57c2b88so1158114a12.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 03:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793183572; x=1793788372; darn=buildroot.org;
 h=content-transfer-encoding:organization:content-type:mime-version
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HBUkYl24vfkDuWwJ0TzTP9FRWA5PS8uTf+Bi8W6xGho=;
 b=UA7sdfsztEu0dv+CLkBMvTGd7c9FkchWGgAGm6oqqmwBWwzUiu3HC55M56kGClk419
 3Y/jGG6e6RmTaEoZapLlk1OJgdR+Fm7XnqW2a+dqFBC+Fib0z3utmP/oGXwIMCYZCSUE
 kxNJgTHFlubzgSuFfL7Fvhr25EpVM3uyuAAcDZWsSoBP7HHZ1tE1yhsjqG1VjXrOzNUY
 vmflGVoou185uyCc7oT3FWS9qY33jzKWbjrQwbktIVC84ZVE7OGf/OG5OEoa3YX7/WxN
 rd3lF38vD/jhIA1jqaYLJu5+M1sfPsQVTQKgRdKCpRNG+8qj4svxt8yucKn7IC/0iDYn
 cPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793183572; x=1793788372;
 h=content-transfer-encoding:organization:content-type:mime-version
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HBUkYl24vfkDuWwJ0TzTP9FRWA5PS8uTf+Bi8W6xGho=;
 b=XjggEWMRRno+Td11e3BT646JmTCOjRO/GrlJ2yXaAICmlnGg8DfcG85JFlfUp351Am
 RT4SoP6HqsNvSpPrkvx9Vb47q7/nM6RWnaYMiGrrp4KjwKMH8wAgTpbnADmCGZG3AxK6
 vt08ySn/lBIVgzxaj1xEEfA3b9u5UTn275JRv/s1kshmhx/k0f0LN/+PlN+9n7SiOeiD
 vCCmDwhycQCK1D7tl/NdbdRLj4DfEwdubB7kMudRXw54tFfX1lMSgXnhimB6lS1XLDb5
 qVocceas9KxVYB7xbP98mibfv3RitwloaIqvRpgLTkNIBAbKiO1x+PQfqD26i425+E7H
 jm3w==
X-Gm-Message-State: AFq9FYJOsa3nZPktifgzrVFnyEomHthkBp5+LsUUpWdHscbwBso/57tj
 UOl8RtlcjjE3NDbqYBK5Id8pbwjdzOxiTP68j/ZJhtPzn9gxA9xQuJn5nkhTDQ==
X-Gm-Gg: AYBFou0C7E5vOdqpfb7rHVR26xXVJO81EXzw3s355Z3iX/k5CJOZg8MOMNOE7TxMckm
 010Uti5uDVLMvhTDrJeZaNfrC6kUa4PBWjDr8c3RvZjEzg0eTmbe8Nwkh9hVZMS1Gc30PFwOrLM
 yG9RP3NQ9teKKdxo5IQYubbVcBN4h8UU6dc5lcebAWNFU1MjquoJe9VDk3cxs63BoxBcpz3wiI4
 4MK/X1K5v+AMygMqFjXRT3184Ib3bhsfDNVDs6B5AN1aM5jA4xlCmP7IcCmd37JSOmj27WcsiUl
 YnUeOTnwOTLfBn3gv8xM1bMSBsYr59tfKd2uwHdldWGz2/1uvB+dHi3a/MxRLenlt1yiTpCcXIF
 SkEftDUvHWxADhNl0GGIYpQn9Sb08sc2Eo+mebUEwaGlyJW8nBbAEIf3d3B1krWB1qokWw1ks66
 MJilxF6COqFrYqLj45hNPDQ//01wfM1WVZWijI3pRJ5dTIXppGm+gkqEY4yzc/COt2F3FhQl76b
 sg2eQE1c3PqkDelGvnwMvJlESxk79AjEN2+iMvn5WuRG1pKjef8mSTs3vvKpfU7EQsZqilAps+i
 I/hJqEWuel76igHYeUwKBH8jdEkSa7fJn39XV0IWa2XCbHysIooVHreANaJPdQqI4zMHllX7+g=
 =
X-Received: by 2002:a17:907:1ca1:b0:c2e:5f8f:e60e with SMTP id
 a640c23a62f3a-c49be01f830mr160160366b.38.1793183572105; 
 Wed, 28 Oct 2026 03:32:52 -0700 (PDT)
Received: from tollan.addiva.ad (h-212-116-93-252.A259.priv.bahnhof.se.
 [212.116.93.252]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd6573dfsm578711666b.52.2026.10.28.03.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 03:32:51 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Wed, 28 Oct 2026 11:32:45 +0100
Message-ID: <20261028103248.1317597-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 0/3] Go: list vendored modules in show-info and
 the SBOM
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

R28gcGFja2FnZXMgc2hvdyB1cCBpbiB0aGUgU0JPTSBhcyBvbmUgY29tcG9uZW50LCBzbyBDVkUg
c2Nhbm5lcnMgbmV2ZXIKc2VlIHRoZSBtb2R1bGVzIHZlbmRvcmVkIGludG8gdGhlbS4gVGhpcyBz
ZXJpZXMgcmVjb3JkcyB0aG9zZSBtb2R1bGVzCmZyb20gdGhlIGJ1aWxkIGluZm8gaW4gdGhlIGJ1
aWx0IGJpbmFyaWVzIGFuZCBhZGRzIHRoZW0gdG8gdGhlIEN5Y2xvbmVEWApvdXRwdXQgYXMgbmVz
dGVkIGNvbXBvbmVudHMuCgpQYXRjaCAzIGlzIGEgcmVsYXRlZCBmaXg6IG92ZXJyaWRlIGFuZCBs
b2NhbCBzb3VyY2VzIHNraXAgdGhlIGRvd25sb2FkCnN0ZXAgdGhhdCBydW5zIGdvIG1vZCB2ZW5k
b3IsIHNvIGEgdHJlZSB3aXRob3V0IHZlbmRvci8gZmFpbGVkIHRvIGJ1aWxkLgoKVGVzdGVkIHdp
dGggYW1hem9uLWVjci1jcmVkZW50aWFsLWhlbHBlciBmcm9tIGFuIG92ZXJyaWRlIHRyZWUgd2l0
aG91dAp2ZW5kb3IvOiBmYWlscyB3aXRob3V0IHBhdGNoIDMsIGJ1aWxkcyB3aXRoIGl0LgoKTWF0
dGlhcyBXYWxzdHLDtm0gKDMpOgogIHBhY2thZ2UvcGtnLWdvbGFuZzogcmVjb3JkIHZlbmRvcmVk
IEdvIG1vZHVsZXMgaW4gc2hvdy1pbmZvCiAgdXRpbHMvZ2VuZXJhdGUtY3ljbG9uZWR4OiBhZGQg
dmVuZG9yZWQgZGVwZW5kZW5jaWVzIGFzIG5lc3RlZAogICAgY29tcG9uZW50cwogIHBhY2thZ2Uv
cGtnLWdvbGFuZzogdmVuZG9yIG1vZHVsZXMgb2YgbG9jYWwgYW5kIG92ZXJyaWRkZW4gc291cmNl
cwoKIHBhY2thZ2UvcGtnLWdvbGFuZy5tayAgICAgICAgICAgICAgICAgICAgICAgICB8IDI0ICsr
KysrKwogcGFja2FnZS9wa2ctdXRpbHMubWsgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcg
KysKIHN1cHBvcnQvc2NyaXB0cy9nby1tb2R1bGVzLWluZm8gICAgICAgICAgICAgICB8IDY3ICsr
KysrKysrKysrKysrKysKIC4uLi90ZXN0cy91dGlscy90ZXN0X2dlbmVyYXRlX2N5Y2xvbmVkeC5w
eSAgICB8IDc2ICsrKysrKysrKysrKysrKysrKysKIHV0aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeCAg
ICAgICAgICAgICAgICAgICAgICB8IDUzICsrKysrKysrKysrKy0KIDUgZmlsZXMgY2hhbmdlZCwg
MjI1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA3NTUgc3Vw
cG9ydC9zY3JpcHRzL2dvLW1vZHVsZXMtaW5mbwoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
