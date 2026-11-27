Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7148606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 19:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QxcV1Yge
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A03AB40D01;
	Fri, 27 Nov 2026 19:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xhw72zLpPTsN; Fri, 27 Nov 2026 19:01:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DC09C40B81
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795806095;
	b=MehVPzItHIWq0ZyaMHc0NjLaf5nCK0EFXLG4VEiVgfhWLQ7aNXfDuG5lV/DWea8uzn0D
	 wMPxs6C6szbOGRV70L6stzDt5pJs1GFjLCRziwobvfdTkYw2sxZoBrWVJ0v1gvz3sGWmD
	 pDLmtxk5GWxhF+E8CIsNB/bymyl5PphizdQs8Aa4HQVuhxZj1AteL2F8zmwBlU/IGvKnO
	 y9fS56JLXu0WGA2T8Hw0v95dxf8OQnPpGtMuiXqG0jSnNr+zWBmavJXEX+EjZ5XBfMwhR
	 gTDBbhbitGJ8luamELUlXMrV6F4DpVva+St1PSzHCs9zyqL4FMsSXlMoJFC0q4HkuSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795806095;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=xdQyAo5Cvx60srG8foSaTxQ2fzriGsziuE+aC9bU7OQ=;
	b=lYgI8lu7iyxL3Zbf4Ovh++yyAswF7O/dyuse2bET9c5UOjOstM5cOzx36Gkg5PvRV+bh
	 SNJP74ztLG/w/Oclw/C7CHVW9nVyg8GY4btGJFpknZV4rwgE1mG4WIMGdOXXhDjR5+A5v
	 778631LhkvcPdJMRmiuq7cCD+KeS7M8AbZZacCQeoCXUIyep/+H/gUL4zETDf7imcvCkw
	 YwG8EO4AQ0ZV7Ag4VLvqfXjG5tTApPhtraviOgpckYtVZrGFHPaCeMBTbqj7YTCzSgtuC
	 3I1wl16TzS54zg+ALW1Ny7qZudKAwms+Si3f8TvhBSzD3z7OZpIarDxpCrT5LPoIU9g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795806094;
	bh=xdQyAo5Cvx60srG8foSaTxQ2fzriGsziuE+aC9bU7OQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=QxcV1YgejWE+N0uKLAdJY35OZy6frWctj73V22hYaGFRQPv/oz7bVF3bIEIpnWD10
	 iWMhLEh4ta51P5r0ECPz+Q+rK/ImqWP4eAvqU/bLt/mmyfMEiMHTpkETEek1+UTM/M
	 /9vBw5rkN+K3Ku9Qyp/EeO+gnHoH0U5RZbPF423E/wmyfq82ncQcrPSpmw8hSzHIKi
	 vW9WqeNuu8AxCp59MkhhGUq6Rs5f80pK4Y1aNjdNJz3d3a1DHmqtbz16Cnd7/tpxpK
	 cTcTrFvPttkwAbqP+bjPTLb1z5nhhSXOPzKSvpaXXu9Y23FBBg5IMfc17ziX6IF30U
	 RNDDJuraCOjVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC09C40B81;
	Fri, 27 Nov 2026 19:01:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A811F2BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 19:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99CA6812CB
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 19:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZQYhgSZ9Zob for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 19:01:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CB709811E7
X-Greylist: delayed 529 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 27 Nov 2026 19:01:31 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB709811E7
 for <buildroot@busybox.net>; Fri, 27 Nov 2026 19:01:31 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E5EA72C81D66;
 Fri, 27 Nov 2026 19:52:38 +0100 (CET)
Message-ID: <eb0634e1-b34a-4a36-9d37-22036b9a51f8@bubu1.eu>
Date: Fri, 27 Nov 2026 19:52:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad.86@gmail.com>, buildroot@busybox.net
References: <20260906094932.638444-1-francois.perrad.86@gmail.com>
Content-Language: en-US
In-Reply-To: <20260906094932.638444-1-francois.perrad.86@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/lpty: bump to version 1.2.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRnJhbmNvaXMsCgpPbiA5LzYvMjYgMTE6NDksIEZyYW5jb2lzIFBlcnJhZCB3cm90ZToKPiBz
d2l0Y2ggdG8gZ2VuZXJpYyBpbmZyYXN0cnVjdHVyZQo+IAo+IGRpZmYgTElDRU5TRTogdXBkYXRl
IGNvcHlyaWdodCB5ZWFycwo+ICAgICAgLSBDb3B5cmlnaHQgKGMpIDIwMTAtMjAxMyBHdW5uYXIg
WsO2dGwgPGd6QHRzZXQuZGU+Cj4gICAgICArIENvcHlyaWdodCAoYykgMjAxMC0yMDE1IEd1bm5h
ciBaw7Z0bCA8Z3pAdHNldC5kZT4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQg
PGZyYW5jb2lzLnBlcnJhZC44NkBnbWFpbC5jb20+Cj4gLS0tCkFwcGxpZWQgdG8gbmV4dCwgdGhh
bmtzIQpJJ3ZlIGFkZGVkIGJhY2sgcGFzc2luZyBUQVJHRVRfTERGTEFHUyBpbnRvIExJQkZMQUcg
d2hpY2ggdGhlIGx1YXJvY2tzIAppbmZyYSBkaWQgYmVmb3JlLgoKKEkgbm90aWNlZCBhZnRlciBJ
IGFscmVhZHkgcmV2aWV3ZWQgdGhpcyBwYXRjaCwgdGhhdCBpdCB3YXMgbWFya2VkIGFzIApyZWpl
Y3RlZCBpbiBwYXRjaHdvcmsgYnV0IHdpdGhvdXQgYW55IHJlYXNvbiBzdGF0ZWQgb3IgYSBub3Rl
IHdobyBkaWQgCnRoYXQuIEFzIHRoZSBwYXRjaCB3YXMgZ29vZCwgSSBhc3N1bWVkIHRoaXMgd2Fz
IGRvbmUgaW4gZXJyb3IsIG1heWJlIGluIAp0aGUgbW92ZSBiZXR3ZWVuIHBhdGNod29yayBpbnN0
YW5jZXMuKQoKQmVzdCwKTWFyY3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
