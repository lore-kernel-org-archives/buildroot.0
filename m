Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8106606A325
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 11:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QshianyF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1DC0405A1;
	Wed, 28 Oct 2026 11:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7evuDadAjk7n; Wed, 28 Oct 2026 11:00:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8B97D405A2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793185212;
	b=iR0zPXnTS8+eKPERZF2VRdVzgl/yQlI09Yr3YIHUeL9q0npoGpxYbrB2vPkhu2/noJvO
	 h+xkucYiDPzfcEuHLUed6iLU4JrXygzdDWzzz6c7amLcdr+rSj7Z1P9bnaloWnbRfyNYw
	 PIU6oDtVZbZsJvEMhWPu8X0jG5H5urP/ciPCuY8M+9Rd9s9Ides1fWaRMUxOlVSpn4z6p
	 zw+3bWprwlqrKRuDBZ9YnMi4GXtJjmqafzzkpVG3dPJJ/b/L8/1pXRVXGhkxt9To6Itct
	 vMzFKJbOHGCCUBoivyXDoc9vVE7GrFqkluXNVTJ7nW/mBlJBA/bMuWmZrleuu67VsxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793185212;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HpNwwLsqtQSEKrtE+1uUN1MnM2rGQiGLOyoctz9M9C8=;
	b=m93Eb/NksAbsf5AIg8NG05yLCMHq2SGgaJIsthjKVkEnlxzO5Cl3STkNM3/RRGCWaoJl
	 gWZUbvgTphxJuVS9CHQFbiInJb9/YkrSnNiltmwtJ9cvPwe8Ly7c8cg9ioFq37hSVrApp
	 blxomrPbjo7g8JVknrmxaSyp49wDOn+OTfodItdfpPk8oiMiXhBwAHNlKYNtwXEMFsQ8d
	 a2gsAUjPb3vIrW5NIPkFNoaRXKa62jrmtV99XbaGjHoAG5dT+JJKS+2wMj+utD8+jnD3a
	 doTAIEZh1NlMAYBnoMPrh2IM7e5vhgYit5fmOPqciNb/a2N8gCCOaa1uVxH/HlW02kA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793185212;
	bh=HpNwwLsqtQSEKrtE+1uUN1MnM2rGQiGLOyoctz9M9C8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QshianyFDIEu/fm24JLgYkGT5PVFgCbs+bQ2uNX4jRMusyjqhtItRxxzxB/Qr4c19
	 OY2CUBYtJ6wwlEENPZmIB1alABp0bhrxzQjpNJfaQRKxsmlBMrG9OcYjp3k/vl/Cak
	 YI/LO8q0pcCyC/Cafv9RVn+jtz5Ljj2Y7uFWBv4teQ6bdrBQ02Qx8lPSWWfOpgn6HU
	 BONhr3meB6/dZMAmBDtgI3K2MAUD4yPxlV/L8PClS4tQyNcpNnOhHwB7EFdGZIzgQ/
	 ctEsIm3o9N1fuHEEAEPf1f1VWlg3OelS2j2CewLl+oTN9rmEX2NbYGd0MbYVAIE56o
	 pKphAhc3tALbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B97D405A2;
	Wed, 28 Oct 2026 11:00:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D7F9D1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2D4C80C09
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ui1EblEqc9zr for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 11:00:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3B09E80BBC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793185209;
 b=Mlb35kFtxhbJ1+WHdc3X6QPJpvVCMHQkqMOcnnB4p9rLUsCP1CnyyW/e4FaT5kVdBg7V
 u5Y6pbhikHSlRom0io02OqelLFgBdKmmeF51mnwlQqKskln51I+4GYAzfOMHAGPcI/DsY
 DaWeLLnlA9YjK0t8u4iOyls9a0/J5/mK1N67GSce8sREtnjU8hZ8FVkDOfE49C0Jzr6yb
 hU18EHKUcyPMIIrod68knaEwIcbstp0uETqU4Sk78kHCyCRWz2umFRfhKbshwZBeZNIhT
 IG3/8l0vdjVgDfFRiCP1anIdeTPzYqxwXaiP6t+rBWB5VDq9afepVdWY2IBPasxiPfQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793185209;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=rZ9c+zt2W6m3LdXaSQDhYBO7OZ6ZDn1K74lLA8biv2s=;
 b=Ut/brBaUMZwf+nNrZ7ThjJRfa/Gt2vubsJMxIlTuxUVuabzSbo1/y64IO6BZzFlSJUTf
 Lfo9HIoBZjQvrAni/YHlCbKFYJ3dx8cor+gGSITY2OZWeRqz+LJsxH1aKlI91Q8AHXDHX
 plsuRZfgXZRyrmOIoXMjM/LucdPjTqxqN9B+FMzJf25jIxcJaOz1ZmwjSMNQB9HsKXkup
 c6ut31vbwnA7DH/p875ehxEDLuTDEqggcedys9ki4LPJDUclmAsJEZmbJWakfvR5wwNu1
 g99Noikrmx4X+vjYuAvUk104o1c7iNTksZf6m0vOj5Ag2e649YPtiMgFNM628FVR2kw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=iJQauTtR; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B09E80BBC
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:00:07 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48df0fa43c5so539404f8f.0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 04:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793185205; x=1793790005;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=rZ9c+zt2W6m3LdXaSQDhYBO7OZ6ZDn1K74lLA8biv2s=;
 b=vkeuu0woa9Z2n7D08VdHr4Y1hwgSDIfA7tp6qovQ9dXof7ZTZaBPVPw1KLk9RGZGVr
 ip7VqTRhMcSe5NiSIyZLZ2v/VsSOpGy2KYl8riKnOfVIXT1yo3ApVPhdoYIpicf/7b2x
 NzfBpClRudPHEQpTgLnfhzvadZCyXcgbS7VO3fGrRTupe/9BPM5pW6UZTYRzK5xvjdPT
 Ond92gTN7CwJJw3y72YSHjlIa1uvmtv/19sNuXbuNIiZKkCz0sM0Ht2CTs8J1PWnoayC
 nf258e3tFkgbEYHSzy1OmFizU+TCiRrcnhVcG7bsozOBty6wwHjc2tioxcn8l3afl/Zx
 MJBQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw1chydb2aIG1PqRzixXjXbBKZzjSP94rRa2YhHDhIuDUJrI/SDfnBxmES78zcaq2T6hgcyWiRKaew=@buildroot.org
X-Gm-Message-State: AFq9FYI74KRUSMGCJNqlbp8gIO2KrIS5uBpqAmDYnmU1Q2s/MXwgJvow
 KVN7cByoqtI4t8WTwUP4rnNsZ8RyfS63SOB4Dvj2ilHeKt53WnwWce1m6mAzaViKgZg=
X-Gm-Gg: AYBFou1pGkvEZzArb5UE1oNPCaiJyLqk5aRkhYc7gYcJ7DnSZ/9+SbuRn4TrSv3IDl/
 +DAQzdD3T7nN7DEvNTrVvuvSPRFE1oiApGbWULHbo9CtGd6q+HwceKsHlXnwOrF8JwLYfTjZUeB
 COAfz1xakyzNX4puaWRUNbYQ1UBrLbOju81GNb31RHs1oYhM0SiAjo1YnUSOjgx/Bpl5inF01Xp
 NVvfFovPaEOqPgwhXztoN96GALaHm72Sa7E+r9IGeG5eKTPAvxoKYVBdlguCnlzzSmzoYBjK7LR
 1ypjOafB+y3Qst+pf9EiQ/Odda6VUQuvL4jLiWhJHAfeGzGlPleORpMxlgol7kVkspG9yJzIlyt
 Z5mlxGKiWQk6oySf0orSLlQkzit7COxsZLnXf4O3ua4nbKMtB8/SxgQO1AjPsX4HB+WHybAq7uA
 z7ZsF959iqH6kjQ7uLJssT3rPjpJ+A3ukxGouV4o/Wmf5n0qCbmLY1U5tBoLsvI6CONquZWDrG/
 aTDi5F6o5nIaLKVVeXRFicDoK4+zssGOB3+uX1PJ/jcVUXHNGgw6fN8ojiR89B49hPq73C2r/km
 Hr2AwWuAEDI1DvxDL8Mq+uA=
X-Received: by 2002:a05:6000:2585:b0:48e:1e39:e893 with SMTP id
 ffacd0b85a97d-48e55a022f8mr13243701f8f.1.1793185205196; 
 Wed, 28 Oct 2026 04:00:05 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecd8dcfsm27612304f8f.50.2026.10.28.04.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 04:00:04 -0700 (PDT)
To: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Christian Stewart <christian@aperture.us>
Date: Wed, 28 Oct 2026 12:00:00 +0100
Message-ID: <20261028110002.400620-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028103248.1317597-2-lazzer@gmail.com>
References: <20261028103248.1317597-2-lazzer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/pkg-golang: record vendored Go
 modules in show-info
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWF0dGlhcywKCkluIHJlcGx5IG9mOgo+IFRoZSBTQk9NIG9ubHkgbGlzdGVkIEdvIHBhY2th
Z2VzIGFzIGEgd2hvbGUsIHRoZSBtb2R1bGVzIHZlbmRvcmVkIGludG8KPiB0aGVtIHdlcmUgaW52
aXNpYmxlIHRvIENWRSBzY2FubmVycy4gUmVhZCB0aGVtIGZyb20gdGhlIGJ1aWxkIGluZm8gdGhl
Cj4gR28gdG9vbGNoYWluIGVtYmVkcyBpbiBlYWNoIGJpbmFyeSwgc28gdGhlIGxpc3QgbWF0Y2hl
cyB3aGF0IHNoaXBzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hdHRpYXMgV2Fsc3Ryw7ZtIDxsYXp6
ZXJAZ21haWwuY29tPgoKSSBoYXZlbid0IHRvdGFsbHkgY2hlY2sgdGhlIHNlcmllcyB5ZXQgYnV0
IGR1cmluZyB0aGUgRUxDRTIwMjYgQnVpbGRyb290IGRldgptZWV0aW5nIHdlIGhhdmUgZGlzY3Vz
c2VkIHRoaXMgaXNzdWUuIEdvIGlzIG5vdCB0aGUgb25seSBjYXNlIHRoaXMgd291bGQgYmUKcmVx
dWlyZWQ6IFJ1c3QsIHRoZSBrZXJuZWwsIHBvdGVudGlhbGx5IE5QTSBwYWNrYWdlcyBhbmQgb3Ro
ZXIgc3RhbmRhbG9uZQpwYWNrYWdlcyB0aGF0IHN1cHBvcnQgZ2VuZXJhdGluZyBhbiBTQk9NIChz
dWNoIGFzIHdvbGZzc2wsIGJyb3RsaSwgLi4uKSB3b3VsZAphbHNvIGJlbmVmaXQgZnJvbSBhIHBy
b3BlciBTQk9NIGdlbmVyYXRpb24gc3VwcG9ydC4KClRoZSBpZGVhIHdhcyB0byBhZGQgYSAiPHBr
Zz5fU0JPTSIgc3RlcCB0byB0aGUgZ2VuZXJpYyBwYWNrYWdlIGluZnJhc3RydWN0dXJlCnNvIHdl
IGNhbiBib3RoIGhhdmUgc29tZXRoaW5nIHNoYXJlZCBwZXIgaW5mcmEgc3VjaCBhcyBHbyBhbmQg
aW5kaXZpZHVhbCBwYWNrYWdlCmltcGxlbWVudGluZyB0aGVpciBvd24gcHJvY2VkdXJlLgpUaGVy
ZSBhcmUgc3RpbGwgc29tZSBtaXNzaW5nIGxpbmtzIGJlZm9yZSB3ZSBtb3ZlIGZvcndhcmQgdGhp
cyB3YXk6CgotIEhvdyBkbyB3ZSBzdXBwb3J0IHRoZSB2YXJpZXR5IG9mIFNCT00gZm9ybWF0IChD
eWNsb25lRFgsIFNQRFgsIGNvbXBpbGF0aW9uCiAgZGF0YWJhc2UpCi0gRG8gd2UgaW5jbHVkZSBp
biB0aGUgQ3ljbG9uZURYIFNCT00gb3IganVzdCByZWZlcmVuY2UgaXQgPwoKU29tZSBxdWVzdGlv
biBmb3IgeW91IGZvciB0aGUgR28gY2FzZToKCi0gV291bGQgaXQgbWFrZSBzZW5zZSB0byB1c2Ug
dGhlIHV0aWxpdHkgQ3ljbG9uZURYIG1haW50YWluIGZvciBHbyBpbnN0ZWFkIFsxXSA/CiAgSWYg
d2UgZ28gd2l0aCB0aGUgIjxwa2c+X1NCT00iIHN0ZXAgSSBkZXNjcmliZWQgaXQncyBzb21ldGhp
bmcgd2UgY291bGQgYWRkCiAgdG8gdGhlIGRlcGVuZGVuY2llcy4gQW5kIFJ1c3QgcGFja2FnZXMg
Y291bGQgYWxzbyB1c2UgdGhlIEN5Y2xvbmVEWCB1dGlsaXR5CiAgZm9yIFJ1c3QuCi0gQ2FuIHlv
dSBjb21wYXJlIHRoZSBvdXRwdXQgb2YgdGhpcyB1dGlsaXR5IHRvIHRoZSBvbmUgeW91IHByb3Bv
c2Ugc28gd2UgY2FuCiAgYmV0dGVyIGFzc2VzcyB0aGUgcHJvcyBhbmQgY29ucyA/CgpbMV0gaHR0
cHM6Ly9naXRodWIuY29tL0N5Y2xvbmVEWC9jeWNsb25lZHgtZ29tb2QKCkJlc3QgUmVnYXJkcywK
UEVSQUxFIFRob21hcwoKPiAtLS0KPiAgcGFja2FnZS9wa2ctZ29sYW5nLm1rICAgICAgICAgICB8
ICA4ICsrKysKPiAgcGFja2FnZS9wa2ctdXRpbHMubWsgICAgICAgICAgICB8ICA3ICsrKysKPiAg
c3VwcG9ydC9zY3JpcHRzL2dvLW1vZHVsZXMtaW5mbyB8IDY3ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDgyIGluc2VydGlvbnMoKykKPiAgY3Jl
YXRlIG1vZGUgMTAwNzU1IHN1cHBvcnQvc2NyaXB0cy9nby1tb2R1bGVzLWluZm8KPiAKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9wa2ctZ29sYW5nLm1rIGIvcGFja2FnZS9wa2ctZ29sYW5nLm1rCj4g
aW5kZXggY2YxMmRkNTZiMC4uMDQzZWZjOTRiZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BrZy1n
b2xhbmcubWsKPiArKysgYi9wYWNrYWdlL3BrZy1nb2xhbmcubWsKPiBAQCAtMjA2LDYgKzIwNiwx
NCBAQCBkZWZpbmUgJCgyKV9JTlNUQUxMX0NNRFMKPiAgZW5kZWYKPiAgZW5kaWYKPiAgCj4gKyMg
UmVjb3JkIHRoZSBHbyBtb2R1bGVzIGxpbmtlZCBpbnRvIHRoZSBidWlsdCBiaW5hcmllcywgZm9y
IHNob3ctaW5mbwo+ICtkZWZpbmUgJCgyKV9HT19NT0RVTEVTX0lORk8KPiArCSQkKFEpJCQoVE9Q
RElSKS9zdXBwb3J0L3NjcmlwdHMvZ28tbW9kdWxlcy1pbmZvIC0tZ28gJCQoR09fQklOKSBcCj4g
KwkJLW8gJCQoQEQpLyQkKFBLR19WRU5ET1JFRF9ERVBTX0ZJTEUpIFwKPiArCQkkJCQkKGZpbmQg
JCQoQEQpL2JpbiAtbWF4ZGVwdGggMSAtdHlwZSBmIDI+L2Rldi9udWxsKQo+ICtlbmRlZgo+ICsk
KDIpX1BPU1RfQlVJTERfSE9PS1MgKz0gJCgyKV9HT19NT0RVTEVTX0lORk8KPiArCj4gICMgQ2Fs
bCB0aGUgZ2VuZXJpYyBwYWNrYWdlIGluZnJhc3RydWN0dXJlIHRvIGdlbmVyYXRlIHRoZSBuZWNl
c3NhcnkgbWFrZQo+ICAjIHRhcmdldHMKPiAgJChjYWxsIGlubmVyLWdlbmVyaWMtcGFja2FnZSwk
KDEpLCQoMiksJCgzKSwkKDQpKQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy11dGlscy5tayBi
L3BhY2thZ2UvcGtnLXV0aWxzLm1rCj4gaW5kZXggMTdiMGFhMTc2MC4uMjFiNDM0YzZiZCAxMDA2
NDQKPiAtLS0gYS9wYWNrYWdlL3BrZy11dGlscy5tawo+ICsrKyBiL3BhY2thZ2UvcGtnLXV0aWxz
Lm1rCj4gQEAgLTExMSw2ICsxMTEsMTAgQEAgZGVmaW5lIGpzb24taW5mbwo+ICAJfQo+ICBlbmRl
Zgo+ICAKPiArIyBGaWxlIGluIGEgcGFja2FnZSBidWlsZCBkaXJlY3RvcnkgbGlzdGluZyB0aGUg
ZGVwZW5kZW5jaWVzIHZlbmRvcmVkIGludG8KPiArIyBpdCwgYXMgYSBKU09OIGxpc3Qgb2Yge25h
bWUsIHZlcnNpb24sIHB1cmx9LCBhZGRlZCB0byBzaG93LWluZm8gd2hlbiBwcmVzZW50Cj4gK1BL
R19WRU5ET1JFRF9ERVBTX0ZJTEUgPSAuYnJfdmVuZG9yZWRfZGVwZW5kZW5jaWVzLmpzb24KPiAr
Cj4gICMgX2pzb24taW5mby1wa2csIF9qc29uLWluZm8tcGtnLWRldGFpbHMsIF9qc29uLWluZm8t
ZnM6IHByaXZhdGUgaGVscGVycwo+ICAjIGZvciBqc29uLWluZm8sIGFib3ZlCj4gIGRlZmluZSBf
anNvbi1pbmZvLXBrZwo+IEBAIC0yMTAsNiArMjE0LDkgQEAgZGVmaW5lIF9qc29uLWluZm8tcGtn
LWRldGFpbHMKPiAgCQkJJChjYWxsIG1rLWpzb24tc3RyLCQocGF0c3Vic3QgJChDT05GSUdfRElS
KS8lLCUsJChwYXRjaCkpKSQoY29tbWEpIFwKPiAgCQkpCj4gIAldLAo+ICsJJChpZiAkKHdpbGRj
YXJkICQoJCgxKV9ESVIpLyQoUEtHX1ZFTkRPUkVEX0RFUFNfRklMRSkpLCBcCj4gKwkJInZlbmRv
cmVkX2RlcGVuZGVuY2llcyI6ICQoc2hlbGwgY2F0ICQoJCgxKV9ESVIpLyQoUEtHX1ZFTkRPUkVE
X0RFUFNfRklMRSkpJChjb21tYSkgXAo+ICsJKQo+ICAJJChpZiAkKCQoMSlfUFJPVklERVMpLCBc
Cj4gIAkJInByb3ZpZGVzIjogWyBcCj4gIAkJCSQoZm9yZWFjaCBwcm92aWRlLCBcCj4gZGlmZiAt
LWdpdCBhL3N1cHBvcnQvc2NyaXB0cy9nby1tb2R1bGVzLWluZm8gYi9zdXBwb3J0L3NjcmlwdHMv
Z28tbW9kdWxlcy1pbmZvCj4gbmV3IGZpbGUgbW9kZSAxMDA3NTUKPiBpbmRleCAwMDAwMDAwMDAw
Li40NzZhNGRlMzMzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3N1cHBvcnQvc2NyaXB0cy9nby1t
b2R1bGVzLWluZm8KPiBAQCAtMCwwICsxLDY3IEBACj4gKyMhL3Vzci9iaW4vZW52IHB5dGhvbjMK
PiArIiIiTGlzdCB0aGUgR28gbW9kdWxlcyBsaW5rZWQgaW50byBhIHNldCBvZiBHbyBiaW5hcmll
cy4KPiArCj4gK1JlYWRzIHRoZSBidWlsZCBpbmZvIHRoYXQgdGhlIEdvIHRvb2xjaGFpbiBlbWJl
ZHMgaW4gZXZlcnkgYmluYXJ5Cj4gKyhnbyB2ZXJzaW9uIC1tIC1qc29uKSBhbmQgd3JpdGVzIHRo
ZSB0aGlyZC1wYXJ0eSBtb2R1bGVzLCBkZWR1cGxpY2F0ZWQKPiArYWNyb3NzIGJpbmFyaWVzLCBh
cyBhIGNvbXBhY3QgSlNPTiBsaXN0LiBNb2R1bGVzIHJlcGxhY2VkIGJ5IGEgbG9jYWwKPiArZGly
ZWN0b3J5IGFyZSBwYXJ0IG9mIHRoZSBwYWNrYWdlIHNvdXJjZSBhbmQgYXJlIGxlZnQgb3V0Lgo+
ICsKPiArRWFjaCBlbnRyeSBoYXMgdGhlIG5hbWUsIHZlcnNpb24gYW5kIHB1cmwgb2YgdGhlIG1v
ZHVsZSB0aGF0IHdhcyBidWlsdC4KPiArV2hlbiBhIHJlcGxhY2UgZGlyZWN0aXZlIHN3YXBwZWQg
aW4gYW5vdGhlciBtb2R1bGUsIHRoZSBvcmlnaW5hbCBpcwo+ICtyZWNvcmRlZCB1bmRlciAicmVw
bGFjZXMiLgo+ICsiIiIKPiArCj4gK2ltcG9ydCBhcmdwYXJzZQo+ICtpbXBvcnQganNvbgo+ICtp
bXBvcnQgc3VicHJvY2Vzcwo+ICtpbXBvcnQgc3lzCj4gK2ltcG9ydCB1cmxsaWIucGFyc2UKPiAr
Cj4gKwo+ICtkZWYgcHVybChwYXRoLCB2ZXJzaW9uKToKPiArICAgIHNlZ21lbnRzID0gW3VybGxp
Yi5wYXJzZS5xdW90ZShzLCBzYWZlPSIiKSBmb3IgcyBpbiBwYXRoLnNwbGl0KCIvIildCj4gKyAg
ICByZXR1cm4gZiJwa2c6Z29sYW5nL3snLycuam9pbihzZWdtZW50cyl9QHt1cmxsaWIucGFyc2Uu
cXVvdGUodmVyc2lvbiwgc2FmZT0nJyl9Igo+ICsKPiArCj4gK2RlZiBpc19sb2NhbChwYXRoKToK
PiArICAgIHJldHVybiBwYXRoLnN0YXJ0c3dpdGgoKCIuLyIsICIuLi8iLCAiLyIpKQo+ICsKPiAr
Cj4gK2RlZiBtb2R1bGUocGF0aCwgdmVyc2lvbik6Cj4gKyAgICByZXR1cm4geyJuYW1lIjogcGF0
aCwgInZlcnNpb24iOiB2ZXJzaW9uLCAicHVybCI6IHB1cmwocGF0aCwgdmVyc2lvbil9Cj4gKwo+
ICsKPiArZGVmIGJpbmFyeV9kZXBzKGdvLCBiaW5hcnkpOgo+ICsgICAgb3V0ID0gc3VicHJvY2Vz
cy5ydW4oW2dvLCAidmVyc2lvbiIsICItbSIsICItanNvbiIsIGJpbmFyeV0sCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICBjaGVjaz1UcnVlLCBjYXB0dXJlX291dHB1dD1UcnVlLCB0ZXh0PVRy
dWUpLnN0ZG91dAo+ICsgICAgcmV0dXJuIGpzb24ubG9hZHMob3V0KS5nZXQoIkRlcHMiKSBvciBb
XQo+ICsKPiArCj4gK2RlZiBtYWluKCk6Cj4gKyAgICBwYXJzZXIgPSBhcmdwYXJzZS5Bcmd1bWVu
dFBhcnNlcihkZXNjcmlwdGlvbj1fX2RvY19fLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZm9ybWF0dGVyX2NsYXNzPWFyZ3BhcnNlLlJhd0Rlc2NyaXB0aW9uSGVscEZv
cm1hdHRlcikKPiArICAgIHBhcnNlci5hZGRfYXJndW1lbnQoIi0tZ28iLCByZXF1aXJlZD1UcnVl
LCBoZWxwPSJQYXRoIHRvIHRoZSBnbyB0b29sIikKPiArICAgIHBhcnNlci5hZGRfYXJndW1lbnQo
Ii1vIiwgIi0tb3V0cHV0IiwgcmVxdWlyZWQ9VHJ1ZSwgaGVscD0iT3V0cHV0IEpTT04gZmlsZSIp
Cj4gKyAgICBwYXJzZXIuYWRkX2FyZ3VtZW50KCJiaW5hcmllcyIsIG5hcmdzPSIqIiwgaGVscD0i
R28gYmluYXJpZXMgdG8gaW5zcGVjdCIpCj4gKyAgICBhcmdzID0gcGFyc2VyLnBhcnNlX2FyZ3Mo
KQo+ICsKPiArICAgIG1vZHVsZXMgPSB7fQo+ICsgICAgZm9yIGJpbmFyeSBpbiBhcmdzLmJpbmFy
aWVzOgo+ICsgICAgICAgIGZvciBkZXAgaW4gYmluYXJ5X2RlcHMoYXJncy5nbywgYmluYXJ5KToK
PiArICAgICAgICAgICAgcmVwbCA9IGRlcC5nZXQoIlJlcGxhY2UiKQo+ICsgICAgICAgICAgICBp
ZiByZXBsOgo+ICsgICAgICAgICAgICAgICAgaWYgaXNfbG9jYWwocmVwbFsiUGF0aCJdKToKPiAr
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZQo+ICsgICAgICAgICAgICAgICAgZW50cnkgPSBt
b2R1bGUocmVwbFsiUGF0aCJdLCByZXBsWyJWZXJzaW9uIl0pCj4gKyAgICAgICAgICAgICAgICBl
bnRyeVsicmVwbGFjZXMiXSA9IG1vZHVsZShkZXBbIlBhdGgiXSwgZGVwWyJWZXJzaW9uIl0pCj4g
KyAgICAgICAgICAgIGVsc2U6Cj4gKyAgICAgICAgICAgICAgICBlbnRyeSA9IG1vZHVsZShkZXBb
IlBhdGgiXSwgZGVwWyJWZXJzaW9uIl0pCj4gKyAgICAgICAgICAgIG1vZHVsZXNbZW50cnlbInB1
cmwiXV0gPSBlbnRyeQo+ICsKPiArICAgIHdpdGggb3BlbihhcmdzLm91dHB1dCwgInciKSBhcyBm
Ogo+ICsgICAgICAgIGpzb24uZHVtcChbbW9kdWxlc1trXSBmb3IgayBpbiBzb3J0ZWQobW9kdWxl
cyldLCBmLCBzZXBhcmF0b3JzPSgiLCIsICI6IikpCj4gKyAgICAgICAgZi53cml0ZSgiXG4iKQo+
ICsKPiArCj4gK2lmIF9fbmFtZV9fID09ICJfX21haW5fXyI6Cj4gKyAgICBzeXMuZXhpdChtYWlu
KCkpCj4gLS0gCj4gMi40My4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
