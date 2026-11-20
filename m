Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB22606A325
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DcXJBus6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vj4kKPhV
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11A2F81681;
	Fri, 20 Nov 2026 13:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuE4gMjdC2nI; Fri, 20 Nov 2026 13:00:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2A1B2815FE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795179626;
	b=fnzAO17yXzoX7cdkbDwTYhFB8aREPBAz4zR085R3Qw6OqgMokIi/ic9CPisj+s7MKUOa
	 jJBCuzzA34iMXW28uv255CHBxfgqifKDSKeJIhojlVozQhX6xp1MDMnL99TEGdPnUA5Ta
	 26jCQyhbTDi1LIgOWb6mQ4+Vrz/QbyFhvk8D+FhsKcOhJCRO9uAirTtp249m9YyYFlFjV
	 ebe38SA/gRBb1xNs98HczSTK/EwFtNNYmVATOEvzEcoolUql8qasPz2Kze7ujiWxUeu4G
	 HbPFNja50jzHRVZUaNz7h0XzdQmkLpRGlsChSmSBTB0NY3xb6yn9e/E+zM6NoH2n6JQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795179626;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Organization:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rGSGdaqn2uU+DyQIHIEbs7Zx+vN9Rz66dFU+C6bYHgs=;
	b=jrGYPvDL2Z4wxkdyeZV9N7khadgWklXSdUCHFpjE/3bAFbesmTsVjmo+WgfGe27Vje/7
	 ZBmxJh2oL9NB4hwb2qelJNO0ELHer179+eCCR1KNWlDZe6UfNSjVNszsjqNovxxhwdl1x
	 SHP7ND854CDYnPobncgxUG4k4/L4gc3s36O2mDtTDby9/NjDy8oxnRAMS8c5m+2fL7HDc
	 QjXU0f0X8fWOtvDuVjYTJcF6o1mIWeLp1KGCWcN3xmIl+ZMUg7Ru2TZ34uPnWZehF+zUJ
	 3Y0CMgTTDCCwfPDIShStsmxaRcyXsHyBf3KkuBJB3B6ii3177QiMsx8B/sW+1ojuVPA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795179626;
	bh=rGSGdaqn2uU+DyQIHIEbs7Zx+vN9Rz66dFU+C6bYHgs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DcXJBus6NF5vKaYHRv57LYAVixH39JKPTR4fI915dxccbRzftvMPDVq2qXymKKi89
	 e4/REurOShknqOux5ydIV9tdQvR3u6zbcOoIdrVnkekM/cKgnccCrWn1MHbvuWhv5k
	 6mxvSJ8YWxLcuJfXrk8F+rlluDaPQHmT2IPPpdhvTw5ncgtQCZQVptyQZZDYZPpAhg
	 ci+385S+xScYq0AzbNgMVljsYLwyeuGbgJhgOWfNqn7244RNOJCKmc0Xb2NU/wz5Xi
	 cCP/yh2V9jhZ/M9TYkIzZ7cag6MBX242Ye0DwIl93lR3S/YFCtfcwMgswZWOdHpJac
	 0GjGzMUmbL17Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A1B2815FE;
	Fri, 20 Nov 2026 13:00:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1463169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2E8D40208
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9GWzeRYJHSj for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 13:00:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A336240A31
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::632"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=vj4kKPhV
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A336240A31
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:00:23 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c247f6687dcso127765166b.2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 05:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795179621; x=1795784421; darn=buildroot.org;
 h=content-transfer-encoding:organization:content-type:mime-version
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GrkBozTPBaFxF7TZ1q2E8k75+64v58EpvOYJEKXdjL8=;
 b=vj4kKPhVqO7OC7oXlcIYllePAkkFQU7rAaSbTvzAMKp+nXWLGKLTKAdAEgwsEfIEDq
 3kvL1cByJ7mtPg0nVxGSgrAxT28q7bzqmiK9iT4vkEMJm7be8AxskJ9ZHz/9sn8Yfyds
 zVTf/ayLMUwQoB3FvqO6rSkSVE5I3E+gEnh3t9A4Mnzn+xPYbys9BIt1mJiGSrOVNAeR
 6ueJwI/3/YVpDWoVUAwb0UjXRj5WqLy0CwKZuaehQ/Iat3XvDhBuRQMwF7LFsTCgiS2v
 9XfeiL2Fqyu4E/vOuTJoXoqyTv6ZkzDnYqaBwome0fuo3ooNrPinT0J8DWc2JVvp9WO2
 7qJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795179621; x=1795784421;
 h=content-transfer-encoding:organization:content-type:mime-version
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GrkBozTPBaFxF7TZ1q2E8k75+64v58EpvOYJEKXdjL8=;
 b=Nap7XywvxivZNaZmD+S4FpP3T5S0gouBiLhbBCPiZV09u26+aA/k7umyO7x11e40sU
 lu5Da5u4GhlRkxPlH+9gPEjqM553L+PuaSexhMiEJE6iCjf4urkL1mQIfkEB1PKWoiE6
 vxjOqgE0IOpMTz3NmfJvCeUocRI4iCEJYzGviopQ7tumSOhlWwzGcqyvTAiswojJr6YY
 Jw9/O7EmDKNSQVs8SzbLIEq/eVP8d8/z0D32E4J/oNohUOy50dJRAaL+iYj0XrovVdEu
 /xCJ17dRDWWNMdDbNaBleMeSpq691ny9b1u7XuGkdpyBUbuKr4HdLi36tpnnCjbDJubP
 p7PQ==
X-Gm-Message-State: APuU4Z/4jJgQKofWErmsd0ZoIh0NfHzwo7RblD/dD8XtraB4e74nHLeB
 Qbdn7eKFYTHM2R3kKKi53qK3KKp8BP1D2YCVIyVSAxMMdfXejS6eEbiNjnen4Q==
X-Gm-Gg: AYBFou1OgAFue22BgWuxVCr1IuJlKgMu/6vl0f6KE0/joSCs9mvu7u5nr4jX4S8QBZf
 SBDQ+zVn5FN1jZwhgPv19aO6TihYdk/DhV+Xi0dwophxIiwKzSQD4cdEjspFrZVYuLA6ey9ZRdU
 qU7kkR6j9z7um13rH7Dh8iDBubxH2T8Pq/kAnh/AxxpqOwMQ2a3NI9i36N3ibLcA2s1zSD/0TSH
 Glkb6smoRXK2oyYYR1LN49qWmoL8GGeMxRpHJXuR5VLGEYKJKiV89VTJXjSOM1fz9qsZn+tJtgJ
 E4MQ+pDwjNE4o/A42z0fII7osh9e49SyhQJFpEHRd/q6u2yv8Vseb68RQy06brRWnMdPzCR9qvS
 L0go2eVZ3XkIuAUfKyeZKGaSzncXDjccrHognxvbDUES2I6esd0XHV3/KDSa4oNGm0JVrvoG+IL
 vBOk/OjrnndCb8d8+V13fBm2En/S7+jq4qExUsboJNKUQtTtZIPi+QQ/ax8JAkkXjwcxLRyzmN1
 O9UgLdLlUBj3ZfLhbOtWMWoKZrT1lKAxp/CBV9F9oVPnisoHGZdZsKqku+7voXn1/N9hDacICDZ
 w3B3RMwXPr9phhWNDlzk/mf23Wcf72lYmaJoi72PnQFkJSgMDg==
X-Received: by 2002:a17:906:6992:b0:c51:24ea:2bd with SMTP id
 a640c23a62f3a-c513ab00b56mr221785366b.39.1795179621233; 
 Fri, 20 Nov 2026 05:00:21 -0800 (PST)
Received: from tollan.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513aea17desm92823566b.44.2026.11.20.05.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 05:00:20 -0800 (PST)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Nov 2026 14:00:13 +0100
Message-ID: <20261120130015.344000-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH v2 0/2] package/hostapd: add WNM and MBO options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgpUaGVzZSB0d28gcGF0Y2hlcyBhZGQgb3B0aW9ucyBmb3IgYnVpbGRpbmcgaG9zdGFwZCB3
aXRoIFdOTSAoSUVFRQo4MDIuMTF2KSBhbmQgTUJPIChXaS1GaSBBZ2lsZSBNdWx0aWJhbmQpLiBC
b3RoIGFyZSBvZmYgYnkgZGVmYXVsdC4KCnYxIFsxXSB3YXMgYSBzaW5nbGUgcGF0Y2ggd2l0aCBi
b3RoIG9wdGlvbnMuIE5vdyBXTk0gaXMgaXRzIG93biBwYXRjaCwKc2luY2UgaXQgY2FuIGJlIHVz
ZWQgd2l0aG91dCBNQk8uIEkgY2FuIHNxdWFzaCB0aGVtIGJhY2sgaWYgdGhhdCBpcwpwcmVmZXJy
ZWQuCgpJJ20gbm90IHN1cmUgYWJvdXQgdGhlIHNlbGVjdCBvZiBXTk0gZnJvbSBNQk8uIGhvc3Rh
cGQgYnVpbGRzIE1CTyBmaW5lCndpdGhvdXQgaXQuIEkgYWRkZWQgaXQgYmVjYXVzZSBNQk8gdXNl
cyBCU1MgdHJhbnNpdGlvbiBtYW5hZ2VtZW50IGZyb20KV05NLiBJIGNhbiBkcm9wIGl0LgoKQnVp
bGQgdGVzdGVkIHdpdGggdXRpbHMvdGVzdC1wa2cuCgpDaGFuZ2VzIHYxIC0+IHYyOgogIC0gc3Bs
aXQgdGhlIFdOTSBvcHRpb24gaW50byBpdHMgb3duIHBhdGNoCiAgLSByZWJhc2VkIG9uIG1hc3Rl
ciwgbm8gY29kZSBjaGFuZ2VzCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290
LzIwMjYwNjA0MTMyMjI4LjI5Nzc1NjItMS1sYXp6ZXJAZ21haWwuY29tLwoKTWF0dGlhcyBXYWxz
dHLDtm0gKDIpOgogIHBhY2thZ2UvaG9zdGFwZDogYWRkIElFRUUgODAyLjExdiAoV05NKSBzdXBw
b3J0IG9wdGlvbgogIHBhY2thZ2UvaG9zdGFwZDogYWRkIE1CTyAoV2ktRmkgQWdpbGUgTXVsdGli
YW5kKSBzdXBwb3J0IG9wdGlvbgoKIHBhY2thZ2UvaG9zdGFwZC9Db25maWcuaW4gIHwgMTkgKysr
KysrKysrKysrKysrKysrKwogcGFja2FnZS9ob3N0YXBkL2hvc3RhcGQubWsgfCAgOCArKysrKysr
KwogMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCgotLSAKMi40My4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
