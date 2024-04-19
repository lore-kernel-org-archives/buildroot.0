Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F172C4345F
	for <buildroot@archiver.kernel.org>; Fri, 19 Apr 2024 14:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 561A741A22;
	Fri, 19 Apr 2024 14:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PutNgp8c78ua; Fri, 19 Apr 2024 14:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D0C041A3E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D0C041A3E;
	Fri, 19 Apr 2024 14:53:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21B681BF33C
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 14:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E4CB60D93
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 14:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3PW-wGBk_Dm for <buildroot@lists.busybox.net>;
 Fri, 19 Apr 2024 14:53:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94FDE60DE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94FDE60DE5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94FDE60DE5
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 14:52:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([5.226.147.226]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVNB1-1s7YVT2fmp-00SN6k; Fri, 19
 Apr 2024 16:52:56 +0200
Date: Fri, 19 Apr 2024 16:52:50 +0200
MIME-Version: 1.0
Message-Id: <20240419-ztext-v1-1-a8d5c2cfcf57@gmx.net>
X-B4-Tracking: v=1; b=H4sIAEGFImYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDE0Nz3aqS1IoSXdPE5OSkxCQzw2SDRCWg2oKi1LTMCrA50bG1tQDrP1q
 5VwAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713538375; l=2040;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=uRR/dSTcMrIYlbIyMLdBa49WRBn6i3MbajDWeXLXWWM=;
 b=+0mCNmJ+4tOvYG1fBC0/cboNiBJMh/KQVgdNJWH+2EvNa1dryfrV6P2ah6BJruo0Wo7WJCBgs
 10If25Vbvx5AtJ51Yl2g9WOPX/SMy9npr+Snh4JL1oWdgfJsg+TJYZ3
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:3xOGQc2CRqg+xhgBh2CMItEXW5qJkfT2lkk/LPhK3WjSy2X+5Ra
 jlC20iewC5yz3H1vrlbb2Jd/sIfz5lxhn3WD1sHrNecFSlkRRvo+WVP5jlpePDanSEFBEJJ
 ZDYMoHAa51sIgP/1WHzZjEWSxHvHTpMAPb3NNFXUXD1DV0lFdBIN+qlIYh4DLy4BMNM+MQ8
 WYMX5ZcSdRI0RYnfejhPQ==
UI-OutboundReport: notjunk:1;M01:P0:FZP28Nv4+pQ=;dhAYc5ef94ZMXx/u4GqJ4iiVeaK
 qLOXjDMsqfPikdlu6QXYqdk0WLiD8V8B3XqHdOjWxfQ+J+w6BRTiqdJNhIeOgGBw9bxJ0vhT2
 K8Y17yQJndXFJtPUPGvhBriIZqBILm+Y93cYw7EZq0oGYzR1xVVuNw0fFXlkHqzbQwSQtUNkc
 Pk2BlIbfjWnPIGUX2i+aeS6PPHBQseuJEI8lHsPWJ+nzQi5bOAmSbCRhd12hhpQJG+4IXSaLX
 jFol0Flr1SoOj7UfZ71ULJI59cUhhMQOS3AJhxLB1iNjDyY3O+ifIHuunzlrTPDN3CEcD85KA
 jrVB4FwV5n51MchTCLZTR1mI5MIohBVgz0OJC1tfFRH+/4C+/9r3hX3yYtNi7HSsyhdE++KtF
 6jByDXbp0HSTktjp2fjp09yRwdlxd4+VIdfGvuJDx2v/eFEx381kTxEVFH5BLYrn9IAc4JlXp
 FEhRtf+y6bqmYmT0lfyXys+duZhrMmlQLmpWBuwaTPPfeId6o+4aO4OFCJht0nSF4nW29iZtH
 UKKm4okfMGZsqqvs4Y8xa4mVuoCBIZ7HshXP5yz4EFDENT1ulMPvbfU+PVs/EfaJvLNyB1QdL
 6/9deD/77/o3Aru0ygmRbn2Qe5DeNjq7Us+PG6YUM5uKkVxN1+9JAGdtQYnWtr+1VUgkZefHi
 g6Hp1Gwoc8kJmj0bQXfs7LOr+xo09wmjFr4PgFvrZCRIiqAMmpN8EXkxfc9lWCpIWlwTcrgmy
 HJNDXLIaB/UWX67Flp7ewfJCMw4/wpmF3ZxmtFLMCGostmhjTF3uvMcW5VyIyMFi3JkQiSqrc
 bLg+CVTwFi1mYhXN5NJtT8F+uEU07EICqDN4Bu6iZmT0E=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1713538377; x=1714143177; i=j.neuschaefer@gmx.net;
 bh=teryNMXpVbqUUpBfXnmdOm30AIOXm7Zwn4mmKbsVjNk=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=lalBRu9ppEpBfFUsplmkkHjMvz3apPmQ1kT3sDfxEQihBtYkyTcYWzBdq0Qk0fl1
 X2oYLOote7F98+DADEigpkmHk+EYRJ19sL0p0TsrIbKO2SqfXmPPPeKSL3sZiqmwm
 8uZ4P9g7Ez1ZafMM4zEudohTo9YFriUwjunz92UjIO/SdpHD8EhdIAQKS8HeGQyEc
 vNUlTSWVQY2p2J6HaspBqO5RR0jaMJ5MF+GpJF45AIwzM74hW36qFI4RVCt36mxMt
 XWWnpP6dAnWXUHqSchHMVa6iGEHf+bbhWzokSqA8Ge9OrNt4c3jB0pzwJuTwsSd9b
 0wcSYsayEpKqfKCR5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=lalBRu9p
Subject: [Buildroot] [PATCH] Config.in: add option to ban textrels
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SWRlYWxseSwgdGhpcyBvcHRpb24gd291bGQgZGVmYXVsdCB0byB5ZXMgd2hlbiBhIG11c2wtYmFz
ZWQgdG9vbGNoYWluIGlzCnVzZWQsIGFzIG11c2wgZG9lc24ndCBzdXBwb3J0IFRFWFRSRUxzWzFd
IGFuZCBwcm9ncmFtcyB3aXRoIFRFWFRSRUxzCndpbGwgY3Jhc2ggb24gc3RhcnQtdXAgdW5kZXIg
bXVzbC4KCkhvd2V2ZXIsIHRvIGF2b2lkIGEgbGFyZ2UgYnVpbGQgZmFsbG91dCwgaXQgZGVmYXVs
dHMgdG8gIm5vIiBmb3Igbm93LgpBZnRlciB0aGlzIG9wdGlvbiBoYXMgYmVlbiBlbmFibGVkIGlu
IGJ1aWxkIHRlc3RzIGZvciBhIHdoaWxlIGFuZCBzb21lCm9mIHRoZSBmYWxsb3V0IGhhcyBiZWVu
IGZpeGVkLCB0aGUgZGVmYXVsdCBjYW4gYmUgY2hhbmdlZC4KClsxXTogaHR0cHM6Ly93d3cub3Bl
bndhbGwuY29tL2xpc3RzL211c2wvMjAyMC8wOS8yNS80CgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVz
Y2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PgotLS0KIENvbmZpZy5pbiAgICAgICAgICAg
fCAxMyArKysrKysrKysrKysrCiBwYWNrYWdlL01ha2VmaWxlLmluIHwgIDQgKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvQ29uZmlnLmluIGIvQ29u
ZmlnLmluCmluZGV4IGU0ZjU4ZjNmNjYuLjI2OTY0YTZiYWMgMTAwNjQ0Ci0tLSBhL0NvbmZpZy5p
bgorKysgYi9Db25maWcuaW4KQEAgLTkwNiw2ICs5MDYsMTkgQEAgZW5kY2hvaWNlCiBjb21tZW50
ICJSRUxvY2F0aW9uIFJlYWQgT25seSAoUkVMUk8pIG5lZWRzIHNoYXJlZCBsaWJyYXJpZXMiCiAJ
ZGVwZW5kcyBvbiAhQlIyX1NIQVJFRF9MSUJTCgorY29uZmlnIEJSMl9MSU5LX1pURVhUCisJYm9v
bCAiRGlzYWxsb3cgdGV4dCBzZWN0aW9uIHJlbG9jYXRpb25zIChURVhUUkVMcykiCisJZGVwZW5k
cyBvbiBCUjJfU0hBUkVEX0xJQlMKKwlkZWZhdWx0IG4gIyBpZGVhbGx5OiBCUjJfVE9PTENIQUlO
X1VTRVNfTVVTTAorCWhlbHAKKwkgIFBhc3MgIi16IHRleHQiIHRvIHRoZSBsaW5rZXIgdG8gZGV0
ZWN0IFRFWFRSRUxzIGFuZCB0aHJvdyBhbiBlcnJvciBpZgorCSAgdGhleSBvY2N1ci4KKworCSAg
VGhpcyBpcyByZWNvbW1lbmRlZCB3aGVuIGJ1aWxkaW5nIGEgc3lzdGVtIHdpdGggbXVzbC1saWJj
LCBiZWNhdXNlCisJICBURVhUUkVMcyBhcmUgbm90IHN1cHBvcnRlZCBvbiBtdXNsLWxpYmM6CisK
KwkgICAgaHR0cHM6Ly93d3cub3BlbndhbGwuY29tL2xpc3RzL211c2wvMjAyMC8wOS8yNS80CisK
IGNvbmZpZyBCUjJfRk9SVElGWV9TT1VSQ0VfQVJDSF9TVVBQT1JUUwogCWJvb2wKIAlkZWZhdWx0
IHkKZGlmZiAtLWdpdCBhL3BhY2thZ2UvTWFrZWZpbGUuaW4gYi9wYWNrYWdlL01ha2VmaWxlLmlu
CmluZGV4IDNlMjc2ZDIzZDYuLmRlOTNkZWZiM2IgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvTWFrZWZp
bGUuaW4KKysrIGIvcGFja2FnZS9NYWtlZmlsZS5pbgpAQCAtMTQ5LDYgKzE0OSwxMCBAQCBlbmRp
ZgoKIFRBUkdFVF9MREZMQUdTID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfTERGTEFHUykp
CgoraWZlcSAoJChCUjJfTElOS19aVEVYVCkseSkKK1RBUkdFVF9MREZMQUdTICs9IC16IHRleHQK
K2VuZGlmCisKICMgQnkgZGVzaWduLCBfRk9SVElGWV9TT1VSQ0UgcmVxdWlyZXMgZ2NjIG9wdGlt
aXphdGlvbiB0byBiZSBlbmFibGVkLgogIyBUaGVyZWZvcmUsIHdlIG5lZWQgdG8gcGFzcyBfRk9S
VElGWV9TT1VSQ0UgYW5kIHRoZSBvcHRpbWl6YXRpb24gbGV2ZWwKICMgdGhyb3VnaCB0aGUgc2Ft
ZSBtZWNoYW5pc20sIGkuZSBjdXJyZW50bHkgdGhyb3VnaCBDRkxBR1MuIFBhc3NpbmcKCi0tLQpi
YXNlLWNvbW1pdDogMjU2YWE4ZWQ4NWY4ZmQ2NWVhMGYwZjI0MmFkYjU1Zjk1YTEzZWIyYgpjaGFu
Z2UtaWQ6IDIwMjQwNDE3LXp0ZXh0LTVhY2NiYWI2MWMwYQoKQmVzdCByZWdhcmRzLAotLQpKLiBO
ZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
