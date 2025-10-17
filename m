Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80700CCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 07:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E16A60851;
	Fri, 17 Oct 2025 07:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0AiwDVoDSIF; Fri, 17 Oct 2025 07:42:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59BB460A77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59BB460A77;
	Fri, 17 Oct 2025 07:42:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C1EBD8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62BD340806
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDUkQvj3vivj for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 07:42:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65CF0407E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65CF0407E9
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65CF0407E9
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:42:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CCAD64E40B36
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 07:42:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A431B606DB;
 Fri, 17 Oct 2025 07:42:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B6345102F2292; 
 Fri, 17 Oct 2025 09:42:53 +0200 (CEST)
Date: Fri, 17 Oct 2025 09:42:45 +0200
Message-Id: <20251017-python-scp-v1-0-b45644fa9afb@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHXz8WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMT3YLKkoz8PN3i5AJdQ6PkNDPzxFTLJINUJaCGgqLUtMwKsGHRsbW
 1AFEbZbpcAAAA
X-Change-ID: 20250924-python-scp-12cf67ae9b0e
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760686974; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=1vq07nxIQR2BNlqOWocQopi6KLyxXcOEuiOmXRjdfRA=;
 b=BrbKCFZODL1uJTmsJj5lbUCtvNwlrVsSOOewvGIMuzAXFAlrqLMe0B+euO7eycL5cOBcqs
 d3Fvs5iWDmeB2YyBcS+Go0m6Mj5do6S627b06Iz2H7eyyeCCnGb9us1pxMmpVU6bj1Gdo5
 rodbEr4+jB9kMThOE5ylJHGZ7y8YTZwNygYjWTuCv3qNkh5MtBX3oAIOc35Vj5m1swi9wu
 n1YE8oEpiMfnQvHMlnBTQTbzsJuol5V2AUN8iDh5Iyyh7zwNtSDUEP/AFM4uiOFgDdJpbd
 nOPgWFx18eYO0yao2CZNRQbCqcaqifTKJAQA+VGKzMWWZWBhn5XEWaZKrZbT+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=BrbKCFZO
Subject: [Buildroot] [PATCH 0/2] package/python-scp: new package
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCnRoaXMgc21hbGwgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIHNtYWxsIHB5dGhv
bi1zY3AgcGFja2FnZSwgd2hpY2gKY29tZXMgb24gdG9wIG9mIHRoZSBwYXJhbWlrbyBweXRob24g
cGFja2FnZSB0byBlYXNlIGRvd25sb2FkL3VwbG9hZCBvZgpmaWxlcyB0aGFua3MgdG8gU0NQIHBy
b3RvY29sLgoKLSBQYXRjaCAxIGJyaW5ncyB0aGUgbmV3IHBhY2thZ2UuIEl0IGlzIG1vc3RseSBi
YXNlZCBvbiAuL3V0aWxzL3NjYW5weXBpCiAgc2NwIC1vIHBhY2thZ2UKLSBQYXRjaCAyIGJyaW5n
cyBhIHNtYWxsIHRlc3QgZW5zdXJpbmcgdGhhdCBweXRob24tc2NwIGlzIHByb3Blcmx5CiAgaW5z
dGFsbGVkIGFuZCBpcyB1c2FibGUKClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxl
eGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQpBbGV4aXMgTG90aG9yw6kgKDIpOgogICAgICBw
YWNrYWdlL3B5dGhvbi1zY3A6IG5ldyBwYWNrYWdlCiAgICAgIHN1cHBvcnQvdGVzdGluZzogYWRk
IHJ1bnRpbWUgdGVzdHMgZm9yIHB5dGhvbi1zY3AKCiBERVZFTE9QRVJTICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsrKwogcGFja2FnZS9Db25maWcuaW4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL3B5dGhvbi1zY3Av
Q29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKysrKysKIHBhY2thZ2UvcHl0
aG9uLXNjcC9weXRob24tc2NwLmhhc2ggICAgICAgICAgICAgICAgIHwgIDUgKysrKysKIHBhY2th
Z2UvcHl0aG9uLXNjcC9weXRob24tc2NwLm1rICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysr
KysrKysrKwogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zY3Au
cHkgfCAxMCArKysrKysrKysKIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0
aG9uX3NjcC5weSAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKwogNyBmaWxlcyBjaGFuZ2Vk
LCA2NCBpbnNlcnRpb25zKCspCi0tLQpiYXNlLWNvbW1pdDogMGMyYTBhNDRmMDBlMmFiOWI0MWEy
YmMzYmYwMTllMTdlZjM3YzQ3MQpjaGFuZ2UtaWQ6IDIwMjUwOTI0LXB5dGhvbi1zY3AtMTJjZjY3
YWU5YjBlCgpCZXN0IHJlZ2FyZHMsCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
