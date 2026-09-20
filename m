Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3037C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A050B8101F;
	Sun, 20 Sep 2026 14:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vhvXufEOAxi; Sun, 20 Sep 2026 14:54:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A7D9280FF3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916089;
	b=o0Fx2RupIJnWIRsOtEriIY6RHaedRELMecpfMmnOD0ebaBfjCNydQovzyZSXT/lLQYjA
	 oqhESCvHN68E68lBvaoiiqY9nIlxTLtu52Ujsq+yRidCXCn7E4JaXOxHtrIKk/YnEQkFs
	 J/ZbhlcGLfvD8LtlDvczbyCuNktBQU/E2Jhl4l8dJLdfRY4S/gpq6SXzJ8wVczGRwgBDR
	 0MbEdyeMGWQtnYLpKb90IVuaMvqWAAxqEXNRlfTHZRAXwvuVGvWtnc2lRRyTLYVwos/Rr
	 6in7w0mjC9INzRAk7iLXEIqBEKI9z2lMZbWW/XP3Vzx+cYEM+3y8Y4oHPrhoCi+jLwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916089;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9TLHPQ4ROuimtB7mO644o6aJnJzeswyG9IqO88KyurQ=;
	b=BHXGpEMgdPguSVzuNG5WzW4rRYBznJJCOoIe81CY0NWfsbLdJM/XM8RIo9UDRIEbWQra
	 kiJZpDy98NtGMf0hqU94McZY17WUtnMC14fzRXuF0v9UEmVGjH+GEwzqz4vJYJOD0eYKS
	 9TBlUXj6qkTWczHTjEasrPqdIoTR+NdeelEypoCqikYKep7SrjPNWmQ71jkohuMNBGUCr
	 SlTFQCfj/weZx3C4sU6qSnpGqUIVbWlPxal48/8fd2zg4Mvlq/ksWY8X23knJW2XHLjw/
	 Vteeu67M1bdNh8Db+SdkDrJmvotVXrBfCJ+A8+KI6n4HJVCtmvfUQiEoUbyeWb34Orw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916089;
	bh=9TLHPQ4ROuimtB7mO644o6aJnJzeswyG9IqO88KyurQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WjHl4EWpz3l7hQ3pnXM8m5TSc3WBU8HerNRc4EUHJc8Lj8C/l5/ywxMtsKU/o5vtm
	 kyC/9RbtLW8B3jJXQSzhagdILgiAifp/y0lRz0QTUm2OJzeFPW1UKqOwd6QsGQBntR
	 vLJYQWAZr7IoEMHo1pfBFsCECYlcWba9O88xzjVevqrpqcEUDMVwQG4uk7QjEzVqoq
	 UzUG90xBAUUm4CWd/N/UDIX4D+gHwJsCvsuSBgD2AVbqTzQ6TEnPtwj3XT9ldXktii
	 lh1H0ddbjn9AMK/iVlJ7CQSbN74kvPEcVpQoHehpZM6nGSfrGvwqTMJWHLShaGu646
	 dRMYJ3p3ab7JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7D9280FF3;
	Sun, 20 Sep 2026 14:54:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8AFE37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAE204002B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:54:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oc_kNCGUTUoq for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:54:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DD3F140022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916087;
 b=F9mtuT9Z9lkV39OC4Cs2v8O70pqg/yIrBURwopaFm9pdm+vci0p3kXPPqb9Cgrq8Dsbe
 TQliUEgZKoNNnXzCcBGCYD21XxXMEhmIvNgr66Ket7iEm1rVHaPOiu9NbsfCq+Q/9GCLc
 N41fM3QgRyB/UUxmL9LwgsutXjI32T5/1hQBIhNHXvf/REfcRHQ4CzXqplq46XX6FZZyF
 T38sB1+R5xioG2hAWFCQRo6OIATISX7VXryd/fAJVjquF2WYEZX1Kzs5pZ50IAtLoAgtx
 nN6YaeURGS8gODNyw+dhINQZrLyxtbcQury+Erju0jDRh4f4buL1McwWJumqTyUuQNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916087;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=paJHYDhT3NPHWu3JbU5vAYV7xq6YLok15BvHVQ/Yl0o=;
 b=UJG9Ddfnkmh0NeCNI4lkuxB/KHD+akCD3RgYAJS+9fjBrD8cCmgxU7fwYll6crNFW7nU
 Dv3wMrj8omefFySVqjVINw7HBpuGPHmLz6OFddHfZoJqnTitTqyEBWo01e59YSaCDvbLq
 +1bxALrLFgQSka4x/whNzR7EANuUAnJqsl3K/n757N5HjqQ9ZdJWnBa4LI5QD/d5KvMVi
 vtQwD3HnhRAsf5z+TJoWgWESTcgw9QQOApqtxhy1DNAL/vmEjdv7W91iTt3a7CLMbrikx
 /lLe+aJxZb2QrhU8MLkOrWYq+RXfe8dAC5JPlkpbAGbNZgDqvnGrz8Zcdksr1JglPIg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dsehi6u2; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=dsehi6u2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD3F140022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915505;
 bh=paJHYDhT3NPHWu3JbU5vAYV7xq6YLok15BvHVQ/Yl0o=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=dsehi6u2pZbeHFsK2KCkU75G50/MVwm1GOlbY7Gb2G2d27u1wgZYO85q8LA0igA0Q
 s380x6vgTMPqqKy2XAld2XD70+ZBFx/le8o6NneZ36/Fxy2CZSSQJP+30E9S3W0ln0
 G08FDXAeZvzuhFaHN5z8dHRQJsyclVOkkEs6SKTEs7LMZlbBq0F16JlWqjSiYAkV9y
 aGnu9QKmiP9zbf3UWJPqZsfcTLSirlB0D1kQSZIxzywvSHyrOH6ulMqn+iiUdyHiNB
 aZEXduv00PUjK6b8wxF0u4cq/NwEwtVOvpVrUdzT25zj5dEdsR/YOQIpsMXAMWRICT
 x4zhYdpdGwnUA==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:OupYkkPVIWxuX2Xprlh81wwfbnbslLBuZu8v1eVPOI+RzU5wtPFyb0wHyLEkguyPX5OQ8kNt2UEcrPcQMssBW3DzTC7gVBf6yn5TiMEvNJC3QQS8hEvepIcV8oAxC71Jfs7ekoRrOVh1wo7GIq/TUuFEjzVWuxTIL0BIkCnUMbI8j2wxPjPQchApbwQ2TPyuOQx2ISCiZghyY6b7XwNJj8PPfkAyOOUW9/yxE067+9BV9bRnvqNJii+Ur1GWMPHNh3LG3MnxLEqhCfa9JQjBQ/js/dvWzkoI5Gjfj4eGms/ghmHQIEAHkjhtpC8VllzvLcq4CmAwIPRKIauMPRh73Nk/BvaFHkDT0wI0e6lmKbTkX4c6K9rlmwkRm6eJ5KaPV9v3FaFbKDfvQNAKwG2shB+m6zI8rogCkDzx2QyH5zn323c0NkYZGv95Goq4O/LVSh0JauEI4Y/D8K2ZYt/2LzNE7KtAdaADiAgDLv/tGpItSMB+NaYwRp3QtLqT6Z2H8vfNJF76Ovytf9D3Kep8PeHIfdgszd0y+lBBBZERZWrLT70ZEMQeaiv9XCyWBQLM
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 26603A4C48A7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imm-000000000hB-23xF
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:12 +0200
Message-ID: <20260920144428.3009612-52-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH v4 51/66] package/rauc: Fix build with OpenSSL
 4.0.0
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

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCiAuLi5OMV9T
VFJJTkdfZ2V0MF9kYXRhLWFuZC1BU04xX1NUUklOR18ucGF0Y2ggfCA0OCArKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvcmF1Yy8wMDAxLXNpZ25hdHVyZS11c2UtQVNOMV9TVFJJTkdfZ2V0MF9kYXRh
LWFuZC1BU04xX1NUUklOR18ucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JhdWMvMDAwMS1z
aWduYXR1cmUtdXNlLUFTTjFfU1RSSU5HX2dldDBfZGF0YS1hbmQtQVNOMV9TVFJJTkdfLnBhdGNo
IGIvcGFja2FnZS9yYXVjLzAwMDEtc2lnbmF0dXJlLXVzZS1BU04xX1NUUklOR19nZXQwX2RhdGEt
YW5kLUFTTjFfU1RSSU5HXy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi5iYTgwMzJjNmU3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9yYXVjLzAwMDEtc2ln
bmF0dXJlLXVzZS1BU04xX1NUUklOR19nZXQwX2RhdGEtYW5kLUFTTjFfU1RSSU5HXy5wYXRjaApA
QCAtMCwwICsxLDQ4IEBACitGcm9tIDEwMWFhY2FmODJkMjUwYmZiOGU1ODFlMDAyYjJjMzgwODY5
MDgwZWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBCcnVubyBUaG9tc2VuIDxicnVu
by50aG9tc2VuQGdtYWlsLmNvbT4KK0RhdGU6IFNhdCwgMTEgQXByIDIwMjYgMTc6MDY6MTAgKzAy
MDAKK1N1YmplY3Q6IFtQQVRDSF0gc2lnbmF0dXJlOiB1c2UgQVNOMV9TVFJJTkdfZ2V0MF9kYXRh
IGFuZCBBU04xX1NUUklOR19sZW5ndGgKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6
IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKKworVXNlIEFTTjFfU1RSSU5HX2dldDBfZGF0YSgpIGFuZCBBU04xX1NUUklOR19sZW5ndGgo
KSBmdW5jdGlvbnMKK2FsbG93IGFuIEFTTjFfU1RSSU5HIHN0cnVjdHVyZSB0byBiZSBtYW5pcHVs
YXRlZC4gQXZvaWQgZXJyb3JzCitsaWtlIHRoaXMgd2hlbiBjb21waWxpbmcgYWdhaW5zdCBPcGVu
U1NMIDQuMDoKKworZXJyb3I6IGludmFsaWQgdXNlIG9mIGluY29tcGxldGUgdHlwZWRlZiDigJhB
U04xX09DVEVUX1NUUklOR+KAmSB7YWthIOKAmHN0cnVjdCBhc24xX3N0cmluZ19zdOKAmX0KKwor
U2lnbmVkLW9mZi1ieTogQnJ1bm8gVGhvbXNlbiA8YnJ1bm8udGhvbXNlbkBnbWFpbC5jb20+CisK
K1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vcmF1Yy9yYXVjL2NvbW1pdC8xMDFhYWNhZjgy
ZDI1MGJmYjhlNTgxZTAwMmIyYzM4MDg2OTA4MGVmCisKK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1
aGxzIDxiZXJuZEBrdWhscy5uZXQ+CistLS0KKyBzcmMvc2lnbmF0dXJlLmMgfCA0ICsrLS0KKyAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorCitkaWZmIC0t
Z2l0IGEvc3JjL3NpZ25hdHVyZS5jIGIvc3JjL3NpZ25hdHVyZS5jCitpbmRleCBkMmFjYWM2Yi4u
OTFiZTdiYjcgMTAwNjQ0CistLS0gYS9zcmMvc2lnbmF0dXJlLmMKKysrKyBiL3NyYy9zaWduYXR1
cmUuYworQEAgLTEzNDQsNyArMTM0NCw3IEBAIGdib29sZWFuIGNtc19nZXRfdW52ZXJpZmllZF9t
YW5pZmVzdChHQnl0ZXMgKnNpZywgR0J5dGVzICoqbWFuaWZlc3QsIEdFcnJvciAqKmVyCisgCQkJ
CSJtaXNzaW5nIG1hbmlmZXN0IGluIGlubGluZSBzaWduYXR1cmUiKTsKKyAJCWdvdG8gb3V0Owor
IAl9CistCWlmICghKCpjb250ZW50KS0+ZGF0YSB8fCAoKCpjb250ZW50KS0+bGVuZ3RoIDw9IDAp
KSB7CisrCWlmICgoQVNOMV9TVFJJTkdfZ2V0MF9kYXRhKCpjb250ZW50KSA9PSBOVUxMKSB8fCAo
QVNOMV9TVFJJTkdfbGVuZ3RoKCpjb250ZW50KSA8PSAwKSkgeworIAkJZ19zZXRfZXJyb3IoCisg
CQkJCWVycm9yLAorIAkJCQlSX1NJR05BVFVSRV9FUlJPUiwKK0BAIC0xMzUzLDcgKzEzNTMsNyBA
QCBnYm9vbGVhbiBjbXNfZ2V0X3VudmVyaWZpZWRfbWFuaWZlc3QoR0J5dGVzICpzaWcsIEdCeXRl
cyAqKm1hbmlmZXN0LCBHRXJyb3IgKiplcgorIAkJZ290byBvdXQ7CisgCX0KKyAKKy0JdG1wID0g
Z19ieXRlc19uZXcoKCpjb250ZW50KS0+ZGF0YSwgKCpjb250ZW50KS0+bGVuZ3RoKTsKKysJdG1w
ID0gZ19ieXRlc19uZXcoQVNOMV9TVFJJTkdfZ2V0MF9kYXRhKCpjb250ZW50KSwgQVNOMV9TVFJJ
TkdfbGVuZ3RoKCpjb250ZW50KSk7CisgCWlmICghdG1wKSB7CisgCQlnX3NldF9lcnJvcl9saXRl
cmFsKAorIAkJCQllcnJvciwKKy0tIAorMi40Ny4zCisKLS0gCjIuNDcuMwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
