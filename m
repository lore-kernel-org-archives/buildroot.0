Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5506CC369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 07:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0215F83295;
	Tue, 15 Apr 2025 07:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdWQpDoCTGcC; Tue, 15 Apr 2025 07:19:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 221BE83386
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 221BE83386;
	Tue, 15 Apr 2025 07:19:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB43A108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 07:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B0F183231
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 07:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bo2dloPCDxUS for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 07:19:33 +0000 (UTC)
X-Greylist: delayed 43222 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 15 Apr 2025 07:19:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E3708322E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E3708322E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E3708322E
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 07:19:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 355541FCE6;
 Tue, 15 Apr 2025 07:19:28 +0000 (UTC)
Date: Tue, 15 Apr 2025 09:19:22 +0200
MIME-Version: 1.0
Message-Id: <20250415-bump_pahole-v1-1-6c6df3ff497f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAHkI/mcC/23MQQ6CMBCF4auQWVvTgVrBlfcwxNAyyiRAmxaJh
 vTuVtYu/5e8b4NIgSnCpdgg0MqR3ZwDDwXYoZufJLjPDaUsT1KhEuY1+bvvBjeSaHqNqlZNZaS
 B/PCBHvzetVube+C4uPDZ8RV/639nRYGiph61rZpOnvXVOLeMPB+tm6BNKX0BovgrD6gAAAA=
X-Change-ID: 20250414-bump_pahole-9d6148493b0b
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Francis Laniel <flaniel@linux.microsoft.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddvkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeevfedtieefvdefgfdvgfejudeiveduledtueelhfehgfeivdfhtefhgfffgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddungdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehflhgrnhhivghlsehlihhnuhigrdhmihgtrhhoshhofhhtrdgtohhmpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrs
 hdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744701568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tN+NgH0koTacEYMxEZZxg0kNKrsMKeO+VmerIIU5H/g=;
 b=gj+bnZkZZzlkgJHHFSXxEaP/0JVD/CVYTVxMiiY2f1ZvBvXBKaLrPRNU4TKKenj/BxjF+s
 d2md8cnDB4QdTJ3krqfydDUo6RQP3Hga/xQwE+ljNOHv3IkY39R6+5fibUUj9KulQ5VId0
 KIfQQMMhsoZ07vn8AXJmBisE4ywaNhIUtZ6sOaHhggmKG95ZPyip6C4+/jVPXmz/tZ+IZA
 EzJPlYw+302EjbdBSJGSzu9a0A63P+cQocQhLO8Q5wBEqwOOHilRo3Hc5W5WEAlznu/btQ
 1ei8ERi8z1sUkaHsNijvb/tZOohR1yG18VJXWUidvZMUruV7jeA5gj5sr9hcgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gj+bnZkZ
Subject: [Buildroot] [PATCH] package/pahole: bump to version 1.28
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gaG9zdHMgd2l0aCBhIHJlY2VudCB2ZXJzaW9uIG9mIGNtYWtlIChlZzogNC4wLjApLCBidWls
ZHMgaW52b2x2aW5nCmhvc3QtcGFob2xlIGZhaWwgd2l0aCB0aGUgZm9sbG93aW5nIGVycm9yOgoK
Q01ha2UgRGVwcmVjYXRpb24gV2FybmluZyBhdCBDTWFrZUxpc3RzLnR4dDoxIChjbWFrZV9taW5p
bXVtX3JlcXVpcmVkKToKICBDb21wYXRpYmlsaXR5IHdpdGggQ01ha2UgPCAzLjUgd2lsbCBiZSBy
ZW1vdmVkIGZyb20gYSBmdXR1cmUgdmVyc2lvbiBvZgogIENNYWtlLgoKICBVcGRhdGUgdGhlIFZF
UlNJT04gYXJndW1lbnQgPG1pbj4gdmFsdWUgb3IgdXNlIGEgLi4uPG1heD4gc3VmZml4IHRvIHRl
bGwKICBDTWFrZSB0aGF0IHRoZSBwcm9qZWN0IGRvZXMgbm90IG5lZWQgY29tcGF0aWJpbGl0eSB3
aXRoIG9sZGVyIHZlcnNpb25zLgoKVGhlIGlzc3VlIGhhcyBhbHJlYWR5IGZpeGVkIGluIHRoZSB1
cHN0cmVhbSBwcm9qZWN0IHdpdGggY29tbWl0CjEyY2ExMTI4MTkxMiAoIkNNYWtlTGlzdHMudHh0
OiBSZXF1aXJlIGNtYWtlIDMuNSBvciBoaWdoZXIiKSwgd2hpY2ggaXMKcGFydCBvZiB2ZXJzaW9u
IDEuMjguCgpVcGdyYWRlIHBhaG9sZSB0byBnZXQgcmlkIG9mIHRoaXMgZXJyb3IuCgpodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vZGV2ZWwvcGFob2xlL3BhaG9sZS5naXQvdHJlZS9ORVdT
P2g9djEuMjgKClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20+Ci0tLQpUaGUgaXNzdWUgaXMgcmVwcm9kdWNpYmxlIHdpdGggdGhpcyBkZWZj
b25maWc6CgpCUjJfYXJtPXkKQlIyX2NvcnRleF9hNz15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUw9
eQpCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU49eQpCUjJfTElOVVhfS0VSTkVMPXkKQlIy
X0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9InZlcnNhdGlsZSIKQlIyX0xJTlVYX0tFUk5FTF9ORUVE
U19IT1NUX1BBSE9MRT15CgpJdCBoYXMgb3JpZ2luYWx5IGJlZW4gZGV0ZWN0ZWQgb24gYW4gb2xk
ZXIgYnVpbGRyb290IHJlbGVhc2UgYnJhbmNoLiBUaGUKaXNzdWUgaXMgYWxzbyBwcmVzZW50IG9u
IDIwMjUuMDIueCwgZG8geW91IHdhbnQgbWUgdG8gc2VuZCB0aGUgcGF0Y2gKYmFja3BvcnQgZml4
aW5nIHRoZSBpc3N1ZSBvbiB0aGUgY3VycmVudCByZWxlYXNlIGJyYW5jaCA/Ci0tLQogcGFja2Fn
ZS9wYWhvbGUvcGFob2xlLmhhc2ggfCAyICstCiBwYWNrYWdlL3BhaG9sZS9wYWhvbGUubWsgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGFob2xlL3BhaG9sZS5oYXNoIGIvcGFja2FnZS9wYWhvbGUv
cGFob2xlLmhhc2gKaW5kZXggYTJkM2QwNDRkYTg1ZmVmYTM2NWEyOTczYmMzNzAzZmEzY2IzZTFk
YS4uZWZhMTIxODQ2ODdlNWZhYWU1MDkyNTE1ZGIxNDg5YmI1MmY3ZGI1MCAxMDA2NDQKLS0tIGEv
cGFja2FnZS9wYWhvbGUvcGFob2xlLmhhc2gKKysrIGIvcGFja2FnZS9wYWhvbGUvcGFob2xlLmhh
c2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY29tcHV0ZWQKLXNoYTI1NiAgODcyMjMyOThk
NGY4ZjlhZGE5YjNjYzVjZWYxYmVkZDdhZWI0NDdjZDgyOTVhYmM0NjZlMDA5YTI2YWNjZmYxMyAg
cGFob2xlLTEuMjcudGFyLmd6CitzaGEyNTYgIDlhMzE5YzIxNGIzODU1NGJlODQzMGE2NzIwNDNk
ODU3MzU1NjRlOGUxZTc4ZGI1YTQxY2JhN2EwM2QwMzgwNTYgIHBhaG9sZS0xLjI4LnRhci5negog
c2hhMjU2ICBhYjE1ZmQ1MjZiZDhkZDE4YTllNzdlYmMxMzk2NTZiZjRkMzNlOTdmYzcyMzhjZDEx
YmY2MGUyYjliODY2NmM2ICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3BhaG9sZS9wYWhv
bGUubWsgYi9wYWNrYWdlL3BhaG9sZS9wYWhvbGUubWsKaW5kZXggZmZiZTRmZjkyNTg3MWQzMWMz
MGVmNWI0MDYxMDNjYWFlOTQ2MWRkOS4uMTUwMzczZmQ3ZTE3OTk5ZDUyYjM2ZTk5ODM3ZjM0OTQ3
NmM2MTE2ZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9wYWhvbGUvcGFob2xlLm1rCisrKyBiL3BhY2th
Z2UvcGFob2xlL3BhaG9sZS5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCiAKLVBBSE9MRV9WRVJTSU9OID0gMS4yNworUEFIT0xFX1ZFUlNJT04gPSAxLjI4CiBQ
QUhPTEVfU0lURSA9IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9kZXZlbC9wYWhvbGUv
cGFob2xlLmdpdC9zbmFwc2hvdAogSE9TVF9QQUhPTEVfREVQRU5ERU5DSUVTID0gXAogCWhvc3Qt
ZWxmdXRpbHMgXAoKLS0tCmJhc2UtY29tbWl0OiA3NmI0ZmQxNTliY2RiYTk3ZWVmZGJjNDI5OWE3
YWU5YjBhNGNkNDIzCmNoYW5nZS1pZDogMjAyNTA0MTQtYnVtcF9wYWhvbGUtOWQ2MTQ4NDkzYjBi
CgpCZXN0IHJlZ2FyZHMsCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
