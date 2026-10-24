Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3494F606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 20:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W6hZfd1L;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=a5J8HHsC
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DCEB406DA;
	Sat, 24 Oct 2026 20:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHMOTh1pJHdQ; Sat, 24 Oct 2026 20:31:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 179D7406E5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792873891;
	b=CLQ/TAiCyl31FYIJsckiONiaxc9bQHxnWYa5ot3OA8qHk43Epd0T89miJ1E/BZSnBISJ
	 RZBupNiONfZWxdSsVN6FJ0o6fq2UN3DjrTK+fsJEfYGAWUqrq9oF8cpiluTm6W9fNUs1n
	 C4v1i41teitkrA4mJtLoLVehYMHBim57F9rIt11rsNroecQmTFJPVVo/RGU7EoZb5Dmbx
	 DZn0JEn6TJ0Q9hTRTsEw7Gf1oqtxmrdXM/ATorFDdPC9uiDzhcGZf1Gz4fkIWNXJs2h05
	 L1Wp7rzkGOqqww1d/Dpevgh6ufUClMl/5DQWYSbX9+IZ87ubFuzkPUG0qgGQKfKlUrQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792873891;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=24ev1n3ih4OOVSCDWg50+bh3C03e2wydkZFXKxGi12g=;
	b=RlW2mY6FNrrwXLKQNLukThxvIh2im2FrnwQlKA+Ynj/g1S1vPbPYKD6JpANUwz3CKoiC
	 DXH+iaxeDf2LtOQk170G5ugMMOO/LFIuW1IoDwNPNod4ibz/ZJ/YwxuADLApFPQAGeFE/
	 jbANyw5pnY9fXcU+dSaVXeF7Y+k1O72h/ZtlWgmi7M9IEH11RrqlvMc031VYbOFWaeac/
	 qG0NpcZotdNLettCNFxu2FmZ0kYC0Z807XZ7AEnR16rdNdAixch1IYSnPGSZWobtle1RV
	 RfLENhinsWBNsm9UvqubbW5qlstYFaHXMkXLjDK0JPbwQ6KFbMY3RYGsCwcdrmPyhqw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792873891;
	bh=24ev1n3ih4OOVSCDWg50+bh3C03e2wydkZFXKxGi12g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W6hZfd1Lxwl7wQeLMpMRgqIf92iBzzo8X8qlMOQuvyN8km863DYuy35ToczaCVH+I
	 uEt9SvCXfvkgrh38m4ZTCnT3hqgh38vg7kt7D1WRqehWBgjhc8zUH/OE6pBcWsr6fx
	 KklRog4PGQfZbfO2E4bD92yN1jrUnBBUhP5EJB2+MKKnEuKw8EwOhizRaDq2WcV9V/
	 HJyEwbxAWSZOnNNzuOl4NdI/nLgqxcqHN7pb+YRg8j3BxWVYXikecZk1IC0GKQbdRh
	 cHVa0GtNkGXKMV03pXbjdbs1nXk7BafQlVyuzsO1EmoiVKlx+qQ6EmELfdVbJzlox9
	 5NT2Oxs+twUiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 179D7406E5;
	Sat, 24 Oct 2026 20:31:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19DEE2F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F337660625
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z49OK0lz1iPA for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 20:31:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EC90C60624
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792873888;
 b=m12ORTxSNFSM6JLD3l2pvlyC6kHK23EIR6r5jJhgHvVob/y17zjsfmi5I8W2c3ZtJDJ+
 xOpToGQwaTFUzIQZnCDcN6TzvEgIm6j6rPbc14drpei3HkNHQ0pPv0SreuJyWi6pvZ51f
 PGvmD1faEKoAMD1Wy1xNdFqHMu2LW+UY/qimFny/MztjUQrNyX11wa+P/ELIG79FiNPXr
 MY0hGiJ26GBepS1SBe08Nu0hJA65/NpmliQglzGXR51m0cSyxCLBJqX3GmdJDOcb1WTPl
 35c+Y+tftJQyJH+jrfMgeMHNRrssBw9+pg9uQL9TOoyRE+1jXnWjtEdWtCWpck283QA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792873888;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=gq/gxPUhcDN14GeobcPPAtu78XF82l3YET7EjrjNxEU=;
 b=NSOqBVOj1zE46HkDSNM9a40NwUYazeuogCXzXrAicwN57yu3C6vgHc83Bcy4mZB9XqT4
 jBn0tdNLlUf3Qr2f9RUAcVF8cQO6b2hf6sxBtyxeu/NSOyqvtkJ2C0vCIub3zOylK243n
 j6VUYaBE8W4tL1hwHZSOYCJ66ldyPPNnAtlGNIg6HHGk1/2s174vDdrHcXoUl8aAIreA5
 nHgNYJsVo1t/gGzecuO1ZYOFNS8MYn9AWbMhO1KIsqV0sX/ptSC0OTcw4GdIQrZ1sOigS
 datB3fs6jS7W/4wzrz7CGr02WMNWpIC7K1geq5z5AzdTY3/4v7tPXjHRyBS2tvCYouQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=a5J8HHsC; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=a5J8HHsC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC90C60624
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792873870;
 bh=gq/gxPUhcDN14GeobcPPAtu78XF82l3YET7EjrjNxEU=;
 h=From:To:Subject:Date:From;
 b=a5J8HHsCFPLXpf2LpGNNuzJ8TLFDcXvWTmQX8rfmYNPZbn4jvSq3c2/yvEq6JR+if
 OaXdfwHq3j46Pc/6jjP4GBq6IMn6iA1Cl9PA0BrZjsDYuurzxBIICZySvrK6ZL+ixv
 0TtOwlpphUypuV08kXGc4GJPFASm4tym/0a1p7dXsMCX6jujwCsXpsLb+RZgLo+p/a
 ZljQ/v7jUm154knR/Oj9wgVXrDuEbGMSzpgbjRM+IlN8yXjgZqsHE+DDvuoubKHpML
 F49vZrXCriGuS0+rpHI40Vz1TvQqwI2D+h3iLbknctyzsXsejZLIvy1BS9jTsHniol
 7FM/r/8ymmKwQ==
X-KAS-Sym: v3:f51bdf72230551df:ItQOhoHdKTvWg0goPmYKXvJL9H6W56pV95e92f2XrMW5g
 7lgLaIeeEvfug8jGdfX1vOXBy+1EpV7jb7Rwxiw22ChBXv5ivne6wJmKZGWwpxubOizKiqb8P4x
 IQ9nbvN+NuS0QVgJ+cW6OJomD29RibcRx9OGAm6mbqqBYfsyE0j7EWGS5tN2+h5cQOAS9EWGq+C
 AhP1VY4d3i8ndF/x6jhli96WYDDyU5w6u2Efrzxt37PPo9HSkOZTjjnDjOsmDnylXWwhjr9PGkP
 AvGG8I92pPSHKWcqGWy+56V+3uF9SA92P+/xaoOkcykntohMjwMepiaqmUe8YMld/CAl7aLQ==:
 E/kgGCaw/PfUwt2/7M9R5eNpHxFKtiibe0TFXaZchWK2JU02qAdt0Atf2U4YvJJCZ9rnSgTgFeB
 k/B4GiziVwjwAaADRomNRcALDaJsTyA2ggRyjJJe+yCAYQ3lzkSvgoZnWbTTbg9KBDsyO0eWwHV
 wypfpR9IQalI2Y5A9qArT6bqcX2KX03+A3epqAMvKkprTELtAwULz0NfEFuCOS8EMJ8q03IMWq4
 dUKSY01ZWwjBuKhIHHGYAYmr8135jdTkfSa8KTfI/O0h8keL6V35oCq3w+uhzxEo6cJXW17xx/G
 9Z+gvN9m049YxsRAJ5EHOfJncIEWEdF23U9pWaKmY0hpLV8lLspWr0vBDfQ/FTuUnKfSw1Kz46Y
 4hXG8nIKIQnC9/aw55tXrxtk3pFUFeqTHVx2iqXkNynhycSMren5XX8Bpyo098oe+E8yEwRKEXo
 uzjqv1ftcEPW03yzaqXnEo9Uu+FXN7h3yZFs55eM0h3tOn+tEiJosywsK+iTWzpXycskt3+CRva
 FQX+3laxZ6Tdr55zcrZ2p2wry6uY7lLDDentXdsdPjPqaBLTg==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 17CFAA4C62C3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 22:31:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44936)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKiOT-000000000Qt-410n
 for buildroot@buildroot.org; Sat, 24 Oct 2026 20:31:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 22:31:07 +0200
Message-ID: <20261024203109.160416-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH 1/2] package/nmap: fix build with
 bootlin-aarch64-glibc-old
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rml4ZXMgYSBidWlsZCBlcnJvciBkZXRlY3RlZCBieSB0aGUgR2l0bGFiIHBpcGVsaW5lcyB3aGlj
aCB3YXMKaW50cm9kdWNlZCBieSB1cHN0cmVhbSBjb21taXQKaHR0cHM6Ly9naXRodWIuY29tL25t
YXAvbm1hcC9jb21taXQvOGVmM2VkMTQ3MWVjYTYxM2YxZDQzZjYwMjkzMmQyYzk5ZDZlMmU3Ywp0
aGF0IHdhcyBmaXJzdCByZWxlYXNlIGluIHZlcnNpb24gNy45OTEuIEJ1aWxkcm9vdCBidW1wZWQg
dGhlIHBhY2thZ2UgdG8KdGhpcyB2ZXJzaW9uIHdpdGggY29tbWl0IDA2OTFhYWMxZGU3NTM3N2Iz
ZGQ4ZDM2OTY1YWI0YTEyOGQ1ZTljYjEuCgpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVy
bmRAa3VobHMubmV0PgotLS0KIC4uLi8wMDAzLXRyYWNlcm91dGUuY2MtaW5jbHVkZS1jc3RkZGVm
LnBhdGNoICB8IDgyICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4MiBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ubWFwLzAwMDMtdHJhY2Vyb3V0
ZS5jYy1pbmNsdWRlLWNzdGRkZWYucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL25tYXAvMDAw
My10cmFjZXJvdXRlLmNjLWluY2x1ZGUtY3N0ZGRlZi5wYXRjaCBiL3BhY2thZ2Uvbm1hcC8wMDAz
LXRyYWNlcm91dGUuY2MtaW5jbHVkZS1jc3RkZGVmLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLjgwMDhiM2ZhNzYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdl
L25tYXAvMDAwMy10cmFjZXJvdXRlLmNjLWluY2x1ZGUtY3N0ZGRlZi5wYXRjaApAQCAtMCwwICsx
LDgyIEBACitGcm9tIDQ0NTU3M2IyN2YzOTk3YjdlYWU0NTZlODQ5ZjAwM2YxOGRlNTM0OWUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0
PgorRGF0ZTogU3VuLCA2IFNlcCAyMDI2IDExOjQxOjI5ICswMjAwCitTdWJqZWN0OiBbUEFUQ0hd
IHRyYWNlcm91dGUuY2M6IGluY2x1ZGUgY3N0ZGRlZgorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRl
bnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNv
ZGluZzogOGJpdAorCitBZGRpbmcgdGhpcyBpbmNsdWRlIGZpeGVzIGEgYnVpbGQgZXJyb3Igc2Vl
biB3aXRoIGFuIG9sZCBidWlsZHJvb3QKK3Rvb2xjaGFpbiBiYXNlZCBvbiBnY2MtNi4zLjAvZ2xp
YmMtMi4yNToKKwordHJhY2Vyb3V0ZS5jYzogSW4gZnVuY3Rpb24g4oCYYm9vbCBwYXJzZV9lbmNh
cHN1bGF0ZWRfcmVwbHkoY29uc3QgdTgqLCB1bnNpZ25lZCBpbnQsIFJlcGx5KinigJk6Cit0cmFj
ZXJvdXRlLmNjOjEwODQ6MjQ6IGVycm9yOiBleHBlY3RlZCBwcmltYXJ5LWV4cHJlc3Npb24gYmVm
b3JlIOKAmHN0cnVjdOKAmQorICAgICBpZiAobGVuIDwgb2Zmc2V0b2Yoc3RydWN0IGljbXAsIGlj
bXBfaWQpICsgMikKKyAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fgorSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIHN0cnVjdF9pcC5oOjU2OjAsCisgICAgICAgICAgICAgICAgIGZyb20gdHJhY2Vy
b3V0ZS5jYzoxMTM6Cit0cmFjZXJvdXRlLmNjOjEwODQ6Mzc6IGVycm9yOiDigJhpY21wX2h1buKA
mSB3YXMgbm90IGRlY2xhcmVkIGluIHRoaXMgc2NvcGUKKyAgICAgaWYgKGxlbiA8IG9mZnNldG9m
KHN0cnVjdCBpY21wLCBpY21wX2lkKSArIDIpCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXgordHJhY2Vyb3V0ZS5jYzoxMDg0OjQ0OiBlcnJvcjog4oCYb2Zmc2V0b2bigJkg
d2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlCisgICAgIGlmIChsZW4gPCBvZmZzZXRvZihz
dHJ1Y3QgaWNtcCwgaWNtcF9pZCkgKyAyKQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBeCit0cmFjZXJvdXRlLmNjOjEwOTE6NTI6IGVycm9yOiBleHBlY3RlZCBw
cmltYXJ5LWV4cHJlc3Npb24gYmVmb3JlIOKAmHN0cnVjdOKAmQorICAgICBpZiAobGVuIDwgc2l6
ZW9mKHN0cnVjdCBpY21wdjZfaGRyKSArIG9mZnNldG9mKHN0cnVjdCBpY21wdjZfbXNnX2VjaG8s
IGljbXB2Nl9zZXEpICsgMikKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn4KK3RyYWNlcm91dGUuY2M6MTA5MTo3NjogZXJyb3I6IOKAmGlj
bXB2Nl9zZXHigJkgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlCisgICAgIGlmIChsZW4g
PCBzaXplb2Yoc3RydWN0IGljbXB2Nl9oZHIpICsgb2Zmc2V0b2Yoc3RydWN0IGljbXB2Nl9tc2df
ZWNobywgaWNtcHY2X3NlcSkgKyAyKQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn4KK3Ry
YWNlcm91dGUuY2M6MTA5MTo4NjogZXJyb3I6IOKAmG9mZnNldG9m4oCZIHdhcyBub3QgZGVjbGFy
ZWQgaW4gdGhpcyBzY29wZQorICAgICBpZiAobGVuIDwgc2l6ZW9mKHN0cnVjdCBpY21wdjZfaGRy
KSArIG9mZnNldG9mKHN0cnVjdCBpY21wdjZfbXNnX2VjaG8sIGljbXB2Nl9zZXEpICsgMikKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXgordHJhY2Vyb3V0ZS5jYzoxMDk4OjI0OiBlcnJv
cjogZXhwZWN0ZWQgcHJpbWFyeS1leHByZXNzaW9uIGJlZm9yZSDigJhzdHJ1Y3TigJkKKyAgICAg
aWYgKGxlbiA8IG9mZnNldG9mKHN0cnVjdCB0Y3BfaGRyLCB0aF9zcG9ydCkgKyAyKSByZXR1cm4g
ZmFsc2U7CisgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KK3RyYWNlcm91dGUuY2M6MTA5
ODo0MDogZXJyb3I6IOKAmHRoX3Nwb3J04oCZIHdhcyBub3QgZGVjbGFyZWQgaW4gdGhpcyBzY29w
ZQorICAgICBpZiAobGVuIDwgb2Zmc2V0b2Yoc3RydWN0IHRjcF9oZHIsIHRoX3Nwb3J0KSArIDIp
IHJldHVybiBmYWxzZTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fgordHJhY2Vyb3V0ZS5jYzoxMDk4OjQ4OiBlcnJvcjog4oCYb2Zmc2V0b2bigJkgd2Fz
IG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlCisgICAgIGlmIChsZW4gPCBvZmZzZXRvZihzdHJ1
Y3QgdGNwX2hkciwgdGhfc3BvcnQpICsgMikgcmV0dXJuIGZhbHNlOworICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgordHJhY2Vyb3V0ZS5jYzoxMTAyOjI0
OiBlcnJvcjogZXhwZWN0ZWQgcHJpbWFyeS1leHByZXNzaW9uIGJlZm9yZSDigJhzdHJ1Y3TigJkK
KyAgICAgaWYgKGxlbiA8IG9mZnNldG9mKHN0cnVjdCB1ZHBfaGRyLCB1aF9zcG9ydCkgKyAyKSBy
ZXR1cm4gZmFsc2U7CisgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KK3RyYWNlcm91dGUu
Y2M6MTEwMjo0MDogZXJyb3I6IOKAmHVoX3Nwb3J04oCZIHdhcyBub3QgZGVjbGFyZWQgaW4gdGhp
cyBzY29wZQorICAgICBpZiAobGVuIDwgb2Zmc2V0b2Yoc3RydWN0IHVkcF9oZHIsIHVoX3Nwb3J0
KSArIDIpIHJldHVybiBmYWxzZTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBefn5+fn5+fgordHJhY2Vyb3V0ZS5jYzoxMTAyOjQ4OiBlcnJvcjog4oCYb2Zmc2V0b2bi
gJkgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlCisgICAgIGlmIChsZW4gPCBvZmZzZXRv
ZihzdHJ1Y3QgdWRwX2hkciwgdWhfc3BvcnQpICsgMikgcmV0dXJuIGZhbHNlOworICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgordHJhY2Vyb3V0ZS5jYzox
MTA2OjI0OiBlcnJvcjogZXhwZWN0ZWQgcHJpbWFyeS1leHByZXNzaW9uIGJlZm9yZSDigJhzdHJ1
Y3TigJkKKyAgICAgaWYgKGxlbiA8IG9mZnNldG9mKHN0cnVjdCBzY3RwX2hkciwgc2hfc3BvcnQp
ICsgMikgcmV0dXJuIGZhbHNlOworICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+Cit0cmFj
ZXJvdXRlLmNjOjExMDY6NDE6IGVycm9yOiDigJhzaF9zcG9ydOKAmSB3YXMgbm90IGRlY2xhcmVk
IGluIHRoaXMgc2NvcGUKKyAgICAgaWYgKGxlbiA8IG9mZnNldG9mKHN0cnVjdCBzY3RwX2hkciwg
c2hfc3BvcnQpICsgMikgcmV0dXJuIGZhbHNlOworICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fgordHJhY2Vyb3V0ZS5jYzoxMTA2OjQ5OiBlcnJvcjog4oCY
b2Zmc2V0b2bigJkgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlCisgICAgIGlmIChsZW4g
PCBvZmZzZXRvZihzdHJ1Y3Qgc2N0cF9oZHIsIHNoX3Nwb3J0KSArIDIpIHJldHVybiBmYWxzZTsK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCisKK1Vw
c3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vbm1hcC9ubWFwL3B1bGwvMzQ3MworCitTaWduZWQt
b2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgorLS0tCisgdHJhY2Vyb3V0ZS5j
YyB8IDEgKworIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQorCitkaWZmIC0tZ2l0IGEv
dHJhY2Vyb3V0ZS5jYyBiL3RyYWNlcm91dGUuY2MKK2luZGV4IDIzMWRlMTBmYy4uNWIwNDBjZTJk
IDEwMDY0NAorLS0tIGEvdHJhY2Vyb3V0ZS5jYworKysrIGIvdHJhY2Vyb3V0ZS5jYworQEAgLTEy
Miw2ICsxMjIsNyBAQCBpbmRpdmlkdWFsbHkuCisgI2luY2x1ZGUgPGRuZXQuaD4KKyAKKyAjaW5j
bHVkZSA8YWxnb3JpdGhtPgorKyNpbmNsdWRlIDxjc3RkZGVmPgorICNpbmNsdWRlIDxsaXN0Pgor
ICNpbmNsdWRlIDxtYXA+CisgI2luY2x1ZGUgPHNldD4KKy0tIAorMi40Ny4zCisKLS0gCjIuNDcu
MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
