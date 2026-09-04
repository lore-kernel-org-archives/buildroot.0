Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6430BC624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 09:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 065F9606F1;
	Fri,  4 Sep 2026 09:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G44E5XR5NiiK; Fri,  4 Sep 2026 09:01:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F27C460738
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788512481;
	b=DNOmPhKT5/8Sks0s12dnfhAWPIbGexkYTmqxdTjupb4QyYEuu1LivLuw/g1xgwPbFXNa
	 ceZwLfYA7zSPE82odws9fpoqLMypHBgfBBYL02ke89IQqFl9iTPAGtOEf4yZ2EHVTfOYf
	 BF4j+4f41IFI7K33KyYaoBfACOps6onTTKz4UZo90hAaVX/xL232CluqGH0VkiZZlS1q0
	 f3flZ4ExgySzDmmZg7hOvXwEWNv8/gjHgP2GsiiOjbQyscJaR1T+iyi0BtY4sVqgcMk7b
	 9TQxKZuCpCPIbD7tHYUWElA3OtKC49h3kvgoACH8piEc8P/9axzPk/MYFteZ69q/Y4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788512481;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-Id:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mFx/M9GxhYn/ASehFTceBwPdKg9PKypgxiCVVcx48YI=;
	b=Sgqnr5QeAg+oSNcbvxiZWYNljtM9Fs3+RRlPeTLP0jqb4cxjXKe6pYHqW9t60T3JAuy0
	 LTCHfT1z8VbjroYUR9trg7PAqyBiSxyYInMNkdgU2vjya5rdBEfVmZJ8KXFqpr2uGyeos
	 jlv8qQ1Mb2OF71uBq62To80YhBQSfreI8l3HhTbWxVK4z/+jsuWCAwGE8TqyVs5a4wkiQ
	 DfQxX9SabMr3Yrx30m/bRiaG5+CVzZHl3q0g/qngKgIG3JqwQhlkNi4nqVHYCt/IkfRfb
	 4ccik2VlgW1aOaFisW16Ul+IRUXPGQfbB6RFWrtwdv4JeH3rh7OalQU8EoWdLCI93DA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788512481;
	bh=mFx/M9GxhYn/ASehFTceBwPdKg9PKypgxiCVVcx48YI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=eh4i/wDAPPXaH4ZtZxs8vWhVY+OnMCyVp+aMvaC/O3POuBFERTxrI+Rrb92JLfnhl
	 hDyOSkW2sAFJ5F5ocEGWHZbU4axzNPoKBucRgf0hLGR50hhZaaN4/t068dFT1ZfW44
	 1fSfzR/1PsGmekJaNM926vGKo6qHK4p+q4SXKhkugREjitcPnZ9mjN/ONQUCRO98Zb
	 cXEVqIyJ0SQgY9khBPX+qG+9EUccZFVdghAJkLxMVbY/Qj5Ou2RuQCtK09DPOuIoSz
	 DErFRvpBHjzVyjN78qqxT3+E99ePrUtx34s6/xcGe1Uf3cQd9PLUuYo2FOtkE9pts9
	 7H35sN68thN4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F27C460738;
	Fri,  4 Sep 2026 09:01:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40D7910E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 09:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22CE24016D
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 09:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_OxvQv1x4EG for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 09:01:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4C4A740080
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788512479;
 b=ej+HRIEcMvtfNfSS1Eyp03eFCS/cQ/x9ks8bphXhBa95FEbhwJRgrv+7nI35RNtuHih+
 on9qxbHkUICOKt7zeb3iQ//wqLR3Sf4dBnQr5UR2akeAr/q5Xs+hILXJeo8dYhvMJLqg8
 Z988u+fUhcWwcBy/H71ddvAJneU/m2lf5TKS7PyPZBbbRhjJ6NYm90eqqXDkPNeC2CX1y
 XoAFiZE9I/wGle+Qa9lPPPPuKfiD5kWfLvA5Be0qNCqIzNLNcJnko86Okusi8zfxHL8uY
 q27T/Y61IH/ufrxQpA1EPT24hsJES5luXu1J0aEF1c6CK8SZXW81jvVdAGwpA7JPK6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788512479;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=doJYn4Uv5mKxmI+dncoclO2Lfa1wqZiLao4PGkiVR2o=;
 b=HnFWHaA1g/ezfvLuEi592NZg0N7ayhWTsWY/JhZJ+SAwvHIP+DHpp09NE/L+4M76TeTM
 EtH1crXTQEsNAqUoSQa/n0Yv7WFVa3+Zv+XHG2bDkkPEHA/mPD5ihcSM4o51nLFAj/MDs
 WGcQf+OJSBh1dKPwZFBI/Hlphv27HoqJJVfh3AL9obp95Aj1RfMdes0Rz0nwJkULjCf3c
 hPoNqn0fF92aVIi+SqvDUm+R2bwfzmI+4QLMPQBBmO5xtjPxkavoYsanbsSVqKVZxr88c
 zjhjDNIcwwjwiPhAJkG9pD88MQUWoLZ9ZTTLCeKAFSRBdOleaHOkJW/6TYjQFDROmlw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.ch; 
 dkim=pass header.d=gmx.ch header.i=stemu86@gmx.ch header.a=rsa-sha256
 header.s=s31663417 header.b=ohZwUilH; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=stemu86@gmx.ch; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C4A740080
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 09:01:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mzyuc-1wgv7z3H2k-00tP3u; Fri, 04
 Sep 2026 11:01:09 +0200
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Stefan=20M=C3=BCller?= <stefan.mueller@rey-technology.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Fri,  4 Sep 2026 09:00:30 +0000
Message-Id: <20260904090032.3492954-1-stemu86@gmx.ch>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:j+wa7ITGHCJAU4Pnrqik+U8ow0D9EjJgfpXFeyVT4dFpy1yWrgv
 Zs1UQSmJepYT+5J32f0c+UlVa6FrKg/U77s/ye5iYgo+isLE0uNefhYHlunkhEBNQSgiGc9
 z+tVyk/g1l+Cn64orGUn8Q0fPLp+eg1cPwV8auUE1qwg88/QLh3a7r5iK2dyxMfhd+bThFl
 8964n3PgPHRYYXh38j86w==
UI-OutboundReport: notjunk:1;M01:P0:3aACHYmwswM=;fb/RfizwdDZs4v52b3pgj0Kykt/
 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
Subject: [Buildroot] [PATCH 2025.02.x 1/1] package/dnsmasq: bump to version
 2.93
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
From: Stefan Mueller via buildroot <buildroot@buildroot.org>
Reply-To: Stefan Mueller <stemu86@gmx.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogU3RlZmFuIE3DvGxsZXIgPHN0ZWZhbi5tdWVsbGVyQHJleS10ZWNobm9sb2d5LmNvbT4K
CkJhY2twb3J0IHRoZSBkbnNtYXNxIDIuOTMgdmVyc2lvbiBidW1wIHRvIHRoZSAyMDI1LjAyLngg
bWFpbnRlbmFuY2UKYnJhbmNoLiBJdCBpcyBhbHJlYWR5IHByZXNlbnQgaW4gbWFzdGVyLgoKVGhp
cyBmaXhlcyBDVkUtMjAyNi0xMjcyNSwgYSBoZWFwIGJ1ZmZlciBvdmVyZmxvdyBpbiBsb2dfcXVl
cnkoKSwKYW5kIENWRS0yMDI2LTEyOTY5LCBhbiBvdXQtb2YtYm91bmRzIHJlYWQgaW4gZmluZF9z
b2EoKS4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBNw7xsbGVyIDxzdGVmYW4ubXVlbGxlckByZXkt
dGVjaG5vbG9neS5jb20+Ci0tLQogcGFja2FnZS9kbnNtYXNxL2Ruc21hc3EuaGFzaCB8IDQgKyst
LQogcGFja2FnZS9kbnNtYXNxL2Ruc21hc3EubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG5z
bWFzcS9kbnNtYXNxLmhhc2ggYi9wYWNrYWdlL2Ruc21hc3EvZG5zbWFzcS5oYXNoCmluZGV4IDc0
ZWU1YzQxNWIuLjE3NmU3Mzg5OWUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZG5zbWFzcS9kbnNtYXNx
Lmhhc2gKKysrIGIvcGFja2FnZS9kbnNtYXNxL2Ruc21hc3EuaGFzaApAQCAtMSw2ICsxLDYgQEAK
ICMgTG9jYWxseSBjYWxjdWxhdGVkIGFmdGVyIGNoZWNraW5nIHBncCBzaWduYXR1cmUKLSMgaHR0
cHM6Ly90aGVrZWxsZXlzLm9yZy51ay9kbnNtYXNxL2Ruc21hc3EtMi45MnJlbDIudGFyLnh6LmFz
Ywotc2hhMjU2ICA0M2Q3MmI4YzEyOWJkZjMzZDE3YmFmZWRjOTg4MjNmNjNlNDZiNTAwNTEyODA2
NmJmMGQyYTQ3MmEzMmNlMDZhICBkbnNtYXNxLTIuOTJyZWwyLnRhci54egorIyBodHRwczovL3Ro
ZWtlbGxleXMub3JnLnVrL2Ruc21hc3EvZG5zbWFzcS0yLjkzLnRhci54ei5hc2MKK3NoYTI1NiAg
MGMwMGQ0ZTVjOTdjODMwNmU1ZmI5MzJiMzQ4YjM0MjY5YzljMjlhMGU3ZGYwZThlODI5NThiNDA3
MDkyYmMxOSAgZG5zbWFzcS0yLjkzLnRhci54egogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKIHNoYTI1
NiAgODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1YWZiNTE0ZDRlNjhhNDA0MDEw
NTIxYjg4MDY0MyAgQ09QWUlORwogc2hhMjU2ICA4Y2ViNGI5ZWU1YWRlZGRlNDdiMzFlOTc1YzFk
OTBjNzNhZDI3YjZiMTY1YTFkY2Q4MGM3YzU0NWViNjViOTAzICBDT1BZSU5HLXYzCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2Ruc21hc3EvZG5zbWFzcS5tayBiL3BhY2thZ2UvZG5zbWFzcS9kbnNtYXNx
Lm1rCmluZGV4IGQ3YWU4YTMzMTIuLmI5YTc2ZmQ1Y2MgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZG5z
bWFzcS9kbnNtYXNxLm1rCisrKyBiL3BhY2thZ2UvZG5zbWFzcS9kbnNtYXNxLm1rCkBAIC00LDcg
KzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotRE5TTUFTUV9WRVJTSU9OID0g
Mi45MnJlbDIKK0ROU01BU1FfVkVSU0lPTiA9IDIuOTMKIEROU01BU1FfU09VUkNFID0gZG5zbWFz
cS0kKEROU01BU1FfVkVSU0lPTikudGFyLnh6CiBETlNNQVNRX1NJVEUgPSBodHRwczovL3RoZWtl
bGxleXMub3JnLnVrL2Ruc21hc3EKIEROU01BU1FfTUFLRV9FTlYgPSAkKFRBUkdFVF9NQUtFX0VO
VikgQ0M9IiQoVEFSR0VUX0NDKSIKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
