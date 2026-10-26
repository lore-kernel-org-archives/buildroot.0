Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33E3606A321
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 09:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LzevP+lV
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B02CE8097B;
	Mon, 26 Oct 2026 09:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWZBWsYFji0A; Mon, 26 Oct 2026 09:43:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9508D809A4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793007836;
	b=CzEM1d89U3QZux64PfAU+k6fHFSg7biWgmBhhGsYLrFVd69H+DxQluMLJmR5W+93ECig
	 72AqFRoA1eokTxn3fyw30CU+60yMzT1yMDogjCU7LBT6WEoZ8A+GUcVicp5L+L1nIABvu
	 AJnmU/hPTP6FnfU37HAyKqS94VTe0ed1FSAEti6iIPebxP0b9yMyVlckbjN+rlGd+qL6u
	 A9d854wo8UqzNFeNdJUHCj77zG9X+D4brj8kiHnCsKiEqgSyCOI8dZjEuqLy7ZzHdNa3N
	 5i07wNs8WCm0YUo/VC1ZlK2VYrHXXkJnZI23fGMMxlO9vxybsMN0OXeeyZw1Q5K1ylA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793007836;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2XE+RQJsBDqu2dgPdu/ji+EzHYTQxG0gBLG3Pr+ZgJM=;
	b=Ekp17s2a5JTUbmYxS4B9rlYEVy6w64Yyl4LquU04KrLt8dt1PTzx6KMpioTQsuJVXE0o
	 K3NcF2l3rKs3KhA2d6qzFt9vug1GcYIATf7UeHul4s7sanxI1cdI4D0V3hNGY0CqAvDyu
	 Rsw9YM8huIzW81TpQ2KD+9gsI/uRcV+I0gjuUDShGq7mAgpYhRUhK8k91I+f311Bo/UFR
	 TIKQUxjB7A4hrEDpeaY+BmrkQKqNLluE2fhS70R5c7u8GhEPh+CJdcq2LrQrTq/mZCtsL
	 El3WcoMpiiG8SZkLzfIDDtBLlt0FF7oRSh6BWeteebgnzndJOmzOwXdjrOr3y3fQLMw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793007836;
	bh=2XE+RQJsBDqu2dgPdu/ji+EzHYTQxG0gBLG3Pr+ZgJM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LzevP+lVjRZVheb/Ygxy+zF3PVgYNYLYNXMmJvNGZRkIJ1VXnRlMQh0p/WAgAyVad
	 FvZcjgy4W5XshBjEE6sW2PiC48ftQ1LoyISzOrn3uKIiYXtIBkhYwRkbVpMEcm+4Lc
	 MzKL/7hl2Gk110pp4t/9je3mxKlstN4YgcrX+8+nGRSpfoJtrFBQZ4wdnQgAElKlEq
	 V7ijTTXT0nY9ezX1yXfIg1wXKmYUuMPbwlUHE0odxXCVFZf0R8ASHQAZuxMpvIsRCW
	 97t0NqWRjICYe1LT5TLxcEBs5W6eXkCSXElo02w4aofvfzM/Vz75KRfuuN782zLtdy
	 I66VCs5G4NT6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9508D809A4;
	Mon, 26 Oct 2026 09:43:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C4ED3D9
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 09:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E42E8097B
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 09:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SlpxHD7MUcV for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 09:43:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3476E8096D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793007833;
 b=PDVSsD1HkCeDiLPgZGlzUcTSxA+7mMtAQFJg1Ls0VPqfXyudn9i0Z4gYNEK8DLEFeTbI
 7AoAXIIdNZ2D218QBJxinYYVWrnndS+ckdzMck/WkNb2u2xtk1iamWXjn0UOYv2TlWvTA
 j1RNeOTJVUvmJn/dDzyDhMwYGXxyVOvxO875WlbklN2Lal8JVLZdPx0bTQQbzGU8q6s9/
 H94bidZ/ex9qaiDZGp6WNo/C9cmrB6+BV8Rl5j8yQXYE1qxRnacpsfy9KjU9DV7cpiBfj
 tJQhaURBo6GUhYayrm8TuHdiopRt7aEQxjMDjSjNKVsAvIh3smGcisUS4RVS5QtVSPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793007833;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=B/Tm2TNQpHbAvE/+kwg7gf/U40ygMPyLG+oGtnfjL80=;
 b=fSxT8JZyzqBKlnq9jJhF3SIuClWYw2erzyNGaWAaRLPOqRx01OPQzRKYxNzZvyukRgMr
 xG6cvAhQEg9G9aHb+LhlY8Cz2OWE5HlX2w17yOVx8NnQ/ZgP+ijjGgazv8FBViGm0Efml
 ymbBlwCqxOmoXt6CM3Ylwvsk8i+ADDGkEgR6q4CleXxJO/wjvLotk90JrwwNGG8gn9sV3
 +7R+NjiaJ5DkwFZxvS8KtxUAoBWzGtwJwgzpVcYBiC+jid+bQyr0LkC81qRVvPycdjYpo
 L8h/XCxAGfvKvR9KEiWUHtvNPaMaV9h6w70u1oG0LzsNXaKKu854yw/CctpZCr2P54g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ceOyB6AS; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3476E8096D
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 09:43:52 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so17192725e9.2
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 02:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793007831; x=1793612631;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=B/Tm2TNQpHbAvE/+kwg7gf/U40ygMPyLG+oGtnfjL80=;
 b=jj0XlWOJ1k8SHNSofy97ZQqvzF4eXsPikWTFswqqE1PtbiEnNOGNXr3nAokGDJIUmI
 BT/2FJQC7rh425FHhsHt092SdbIGFSmdgONKgUnnQ/r1+EOeI4nzkUI5de7nofYgvSWO
 L/oemCNkRxbwB9x1OXZ9ZCjBYF0U59vocWsGJT6F8Ptc7f5RZH5RsnJJ4WqAbrC1XPFf
 uSkyk1LjzIK0RQAji3M72QClYCWeykeHzrvXIKyLdstrHGgyWaUYp4XhdDFcn4o9ENGh
 x/hSvdPKR0Za/mfFg5kC7rnDYb2MHfLEcT0xfMN1zXXwYnzENeUI9Whejc4v0vssMIaM
 xA2g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxlidy+Nf7rHu5AANsmDutZLk2oUXiMzcCWkE2jMhkZSHJIAXrBoUqd/eTXQuNdNYEkV8XLzo3YZO8=@buildroot.org
X-Gm-Message-State: AFq9FYLNOJimyafN6AEH4xZ+lK9WJ4GSuFrQVmnzib4cvaqrye4zr84J
 IAxjaNfbDyjcep9+AHqkTV2OPfuaKXkfdcd/JrpqheFjeFonr/dQZEgeY/9Ons+Mi8JAK5wvdbQ
 OCB7p
X-Gm-Gg: AYBFou0oC8LBmSyQ90tVw/0pg/9NCNlmRvOaBRBmf+5CA/Fv3uyvHOctxZ4wCSr3fig
 hLh/UjZtkCSkT38hnwM+5KT60fsq25zEiXaXuEM07RTlBKDbEZipYf51mCvHIOcHdZR17SUBIxf
 GfHc3SvSUwAfF90JGySpXxODYltNXo7I0wYwK1eJTx6CmVJhmRXETBiKG3YVaFa3SzyHpN2fs1I
 c6c+q5WMMBqWPq2vams2JHc7ya+JxsUJSmYrweliP3oL9fc1OoArhHRsRmhYxfIwk61hZ2RyzQD
 MpijMKwRgkJGV2h3m2IFjw9Im4/WQBzhu1aBsfofve3tPTdQ9o4MgpTrMooHskN/x21j7dZJXnk
 MD1BPPJmKt57c0i6I98WkWmwPwXs/DlMb0VEuPpAb114oAFOk+jXDCNkyQaXetWmCyiWNQPFcBn
 IrxPqclJeiADirK4Dh/BWDNhAp0f+/fBB8dzrZlDdQx490KzVJHzeYbIhZNwQAQUGj9/qrJstEo
 5MV3y1bCep/LKWPzGthfRMUYMNv+RR7wce9S9+Lu3RIMjSR
X-Received: by 2002:a05:600c:e547:20b0:4a7:4697:dae3 with SMTP id
 5b1f17b1804b1-4a74697dafamr5695915e9.24.1793007830608; 
 Mon, 26 Oct 2026 02:43:50 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc3dcbsm15373216f8f.14.2026.10.26.02.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 02:43:50 -0700 (PDT)
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Thomas Perale <thomas.perale@mind.be>, Fiona Klute <fiona.klute@gmx.de>,
 buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>
Date: Mon, 26 Oct 2026 10:43:48 +0100
Message-ID: <20261026094349.29153-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <255e4bd5-e384-4ac9-95fe-1a61f9c3207a@rnout.be>
References: <255e4bd5-e384-4ac9-95fe-1a61f9c3207a@rnout.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 2/2] utils/generate-cyclonedx: include
 external tree information
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
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQXJub3V0LCBGaW9uYQoKSW4gcmVwbHkgb2Y6Cj4gT24gMjUvMTAvMjAyNiAxMjoxNCwgVGhv
bWFzIFBlcmFsZSB3cm90ZToKPiA+IEhlbGxvIEZpb25hLCBBcm5vdXQsCj4gPiA+IEluIHJlcGx5
IG9mOgo+ID4+IEFtIDI0LjEwLjI2IHVtIDIxOjUwIHNjaHJpZWIgQXJub3V0IFZhbmRlY2FwcGVs
bGU6Cj4gPj4+Pj4gT24gMjQvMTAvMjAyNiAyMTozOSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgdmlh
IGJ1aWxkcm9vdCB3cm90ZToKPiA+Pj4+ICDCoMKgSGkgYWxsLAo+ID4+Pj4+ICDCoMKgSSBkb24n
dCBoYXZlIGEgc29sdXRpb24gdW5mb3J0dW5hdGVseS4uLgo+ID4+Cj4gPj4gVGhhdCdzIHdoeSBt
eSBwYXRjaCB0aGF0IHN0YXJ0ZWQgdGhpcyBkaXNjdXNzaW9uIChpbiBjYXNlIHRoZSB0aHJlYWQg
YnJva2U6IFsyXSkgZGVmaW5lcyBhIHByb3BlcnR5IHRvIGNhcnJ5IHRoYXQgaW5mb3JtYXRpb24u
IFRoYXQgd2F5IGl0J3MgdW5hbWJpZ3VvdXMuIFN1cmUsIGV4aXN0aW5nIEN5Y2xvbmVEWCB0b29s
aW5nIHdvbid0IHVuZGVyc3RhbmQgdGhhdCBtZWFuaW5nLCBidXQgc28gZmFyIHdlJ3ZlIG1vc3Rs
eSBhZ3JlZWQgdGhlcmUncyBubyBleGlzdGluZyBlbGVtZW50IHRoYXQgY29ycmVjdGx5IGNhcnJp
ZXMgdGhlIG1lYW5pbmcuCj4gPj4KPiA+Pj4gICDCoEFjdHVhbGx5IEkgZm91bmQgc29tZXRoaW5n
OiBjb21wb3NpdGlvbnMgWzFdLiBJdCdzIG5vdCBfZXhhY3RseV8gd2hhdCA+IHdlIG5lZWQgLSBJ
IHRoaW5rIGl0J3MgbW9yZSBmb3IgdHJhY2tpbmcgdmVuZG9yZWQgcGFja2FnZXMuIEJ1dCBpdCdz
ID4gYmV0dGVyIHRoYW4gdGhlIGFsdGVybmF0aXZlcyBJIHRoaW5rLgo+ID4+Cj4gPj4gSG93IHdv
dWxkIHRoYXQgbG9vaz8gRnJvbSBsb29raW5nIGF0IHRoZSBzY2hlbWEgSSBjYW4ndCBpbWFnaW5l
IGhvdyB5b3UnZCB1c2UgaXQgdG8gZGVzY3JpYmUgInRoaXMgcGFja2FnZSBjb21lcyBmcm9tIHRo
YXQgZXh0ZXJuYWwgdHJlZSIsIG9yIHRoZSBtZXRhZGF0YSBvZiB0aGUgZXh0ZXJuYWwgdHJlZS4K
PiA+ID4gTm8gY29tcG9zaXRpb24gaXMgZm9yIHNvbWV0aGluZyBlbHNlIHNlZSBbMV0gc2VjdGlv
bjoKPiA+ID4gYEVzdGFibGlzaGluZyByZWxhdGlvbnNoaXBzIGluIEN5Y2xvbmVEWGAKPiA+ICAg
IC0+IGBDb21wb3NpdGlvbiBDb21wbGV0ZW5lc3MgYW5kICJLbm93biBVbmtub3ducyJgCj4gPiA+
IFRoaXMgc2VjdGlvbiAiVGhpcyBhbGxvd3MgQk9NIGF1dGhvcnMgdG8gZGVzY3JpYmUgaG93IGNv
bXBsZXRlIHRoZSBCT00gaXMgb3IgaWYKPiA+IHRoZXJlIGFyZSBjb21wb25lbnRzIGluIHRoZSBC
T00gd2hlcmUgY29tcGxldGVuZXNzIGlzIHVua25vd24gb3IgaGFzIGJlZW4KPiA+IHJlZGFjdGVk
Ii4gU28gaWYgeW91IGhhdmUgcGFydCBvZiB5b3VyIGJvbSB3aGVyZSB0aGUgZGVwZW5kZW5jaWVz
IGFyZSB1bmtub3duCj4gPiB5b3UgY291bGQgdXNlIHRoaXMgc2VjdGlvbiB0byBkb2N1bWVudCBp
dCBpZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5Lgo+IEluIHRoYXQgY2FzZSB0aGVyZSBpc24ndCBh
bnl0aGluZyB0aGF0IGZpdHMuIEkgdGhpbmsgdGhlIGN1c3RvbSBwcm9wZXJ0aWVzIGFyZSBiZXR0
ZXIgdGhhbiBhYnVzaW5nIGRlcGVuZGVuY2llcyBpbiB0aGF0IGNhc2UuCj4gCj4gCj4gIFJlZ2Fy
ZHMsCj4gIEFybm91dAoKVGhpcyBkaXNjdXNzaW9uIGFyb3VuZCB0aGUgJ2NvbXBvc2l0aW9ucycg
cHJvcGVydHkgbWFkZSBtZSB0aGluayBpZiB0aGlzIHdvdWxkCmJlIGV2ZW4gbmVlZGVkIGZvciBC
dWlsZHJvb3QgcmlnaHQgbm93LgoKVGhlIGNhc2Ugd2hlcmUgSSBjb3VsZCBzZWUgdGhhdCBpdCdz
IGFjdHVhbGx5IG5lZWRlZCBpcyB0byBkb2N1bWVudCB0aGUKbWFuZGF0b3J5IHBhY2thZ2VzIHRv
IHJ1biBCdWlsZHJvb3Q6CgoqIHdoaWNoCiogc2VkCiogbWFrZQoqIGJpbnV0aWxzCiogYnVpbGQt
ZXNzZW50aWFsCiogZGlmZnV0aWxzCiogZ2NjCiogZysrCiogYmFzaAoqIHBhdGNoCiogZ3ppcAoq
IGJ6aXAyCiogcGVybAoqIHRhcgoqIGNwaW8KKiB1bnppcAoqIHJzeW5jKwoqIGZpbGUKKiBiYwoq
IGZpbmR1dGlscwoqIGF3awoKSW4gdGhlb3J5IHlvdSBuZWVkIHRvIG1ha2UgdGhlICdidWlsZHJv
b3QnIGNvbXBvbmVudCBkZXBlbmRzIG9uIHRob3NlIHN5c3RlbSBwYWNrYWdlcy4KU2luY2UgeW91
IGhhdmUgbm8ga25vd2xlZGdlIGFib3V0IHRob3NlIHBhY2thZ2VzIHRoZXkgd291bGQgYmUgcmVw
cmVzZW50ZWQgaW4geW91ciBTQk9NCmFzIHN1Y2g6CgpgYGBqc29uCnsKICAuLi4KICAiY29tcG9u
ZW50cyI6IFsKICAgLi4uCiAgIHsKICAgICAiYm9tLXJlZiI6ICJob3N0LXdoaWNoIiwKICAgICAi
bmFtZSI6ICJ3aGljaCIKICAgfSwKICAgewogICAgICJib20tcmVmIjogImhvc3Qtc2VkIiwKICAg
ICAibmFtZSI6ICJzZWQiCiAgIH0sCiAgIHsKICAgICAiYm9tLXJlZiI6ICJob3N0LW1ha2UiLAog
ICAgICJuYW1lIjogIm1ha2UiCiAgIH0sCgogIF0KICAiY29tcG9zaXRpb25zIjogWwogICAgewog
ICAgICAiYWdncmVnYXRlIjogImNvbXBsZXRlIiwKICAgICAgImFzc2VtYmxpZXMiOiBbLi4uPGFs
bCB0aGUgcGFja2FnZXMgd2UgYnVpbGQgd2l0aCBidWlsZHJvb3Q+XQogICAgfSwKICAgIHsKICAg
ICAgImFnZ3JlZ2F0ZSI6ICJ1bmtub3duIiwKICAgICAgImFzc2VtYmxpZXMiOiBbImhvc3Qtd2hp
Y2giLCAiaG9zdC1zZWQiLCAiaG9zdC1tYWtlIiwgLi4uXQogICAgfQogIF0sCiAgImRlcGVuZGVu
Y2llcyI6IFsKICAgIHsKICAgICAgInJlZiI6ICJidWlsZHJvb3QiLAogICAgICAiZGVwZW5kc09u
IjogWyJob3N0LXdoaWNoIiwgImhvc3Qtc2VkIiwgImhvc3QtbWFrZSIsIC4uLl0KICAgIH0KICBd
Cn0KYGBgCgpTbyB0byBtZSwgdGhpcyByYWlzZSB0aGUgcXVlc3Rpb24gd2hhdCBpcyBCdWlsZHJv
b3QgZXhhY3RseSA/IElmIGl0J3MgYSBidWlsZAppbmZyYXN0cnVjdHVyZSBzdWNoIGFzIGNtYWtl
IHdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gaW5jbHVkZSBpdCBhcyBhICdob3N0Jwpjb21wb25lbnQg
aW4gdGhlIFNCT00gKG9yICdzY29wZSc6ICdleGNsdWRlZCcgYXMgd2UgZGVmaW5lIGl0IGhlcmUg
aW4gQ0RYKS4KCmBgYGpzb24KewogICJjb21wb25lbnRzIjogWwogICAgewogICAgICAiYm9tLXJl
ZiI6ICJob3N0LWJ1aWxkcm9vdCIsCiAgICAgICJuYW1lIjogImJ1aWxkcm9vdCIsCiAgICAgICJ2
ZXJzaW9uIjogIm1hc3RlciIsCiAgICAgICJjcGUiOiAiLi4uIgogICAgfQogIF0KfQpgYGAKCkxp
a2UgdGhlIG90aGVyIGNvbXBvbmVudCBCdWlsZHJvb3QgaGFzIGl0cyBvd24gc2V0IG9mIGRlcGVu
ZGVuY2llcyBhbmQgdGhlCnBhY2thZ2VzIHRoYXQgYXJlIGJ1aWx0IGJ5IEJ1aWxkcm9vdCBkZXBl
bmRzIG9uIEJ1aWxkcm9vdCBpbmZyYXN0cnVjdHVyZSBhbmQKaXRzIGRlcGVuZGVuY2llcy4KV2Ug
bmVlZCB0byBkb2N1bWVudCB0aGUgZGVwZW5kZW5jaWVzIG9mIEJ1aWxkcm9vdCBzb21ld2hlcmUg
aW4gdGhlIFNCT00gaW4KdGhlb3J5LgoKSWYgQnVpbGRyb290IGlzIGEgY29tcG9uZW50IHdoYXQg
YXJlIHRoZSBCdWlsZHJvb3QgZXh0ZXJuYWwgdGhlbiA/IEltbyB0aGV5CmFsc28gYXJlIHNvbWUg
a2luZCBvZiBjb21wb25lbnQgdGhhdCBkZXBlbmRzIG9uIHRoZSBCdWlsZHJvb3QgaW5mcmFzdHJ1
Y3R1cmUuCkRlcGVuZGluZyBvbiB3aGF0IGRvd25zdHJlYW0gdXNlciBhcmUgZG9pbmcgdGhlIGV4
dGVybmFsIG1heSBoYXZlIGFsc28gYSBzZXQgb2YKaW50ZXJuYWwgZGVwZW5kZW5jaWVzIGRpZmZl
cmVudCB0byBidWlsZHJvb3QgaXRzZWxmLiBUaG9zZSBhbHNvIG5lZWRzIHRvIGJlCmRvY3VtZW50
ZWQuCgpBbGwgb2YgdGhpcyBpcyByZWFsbHkgdGhlb3JpdGljYWwgYnV0IHRoaXMgZGVmaW5pdGlv
biBpcyBpbW8ga2V5IHRvIHJlc29sdmUgdGhlCmxpbmsgYmV0d2VlbiB0aGUgZXh0ZXJuYWwgYW5k
IHRoZSBjb21wb25lbnRzIHRoZXkgcHJvdmlkZXMuCgpPZiBjb3Vyc2UsIHRoaXMgY29udmVyc2F0
aW9uIGRvZXNuJ3QgZXhjbHVkZSBpbmNsdWRpbmcgdGhlIHJlZmVyZW5jZSB0byB0aGUKZXh0ZXJu
YWwgaW4gdGhlICdwcm9wZXJ0aWVzJyBzZWN0aW9uLgoKQmVzdCBSZWdhcmRzLApQRVJBTEUgVGhv
bWFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
