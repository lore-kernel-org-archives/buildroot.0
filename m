Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B48C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 13:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78CD96085B;
	Tue, 23 Jul 2024 13:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id km6OePi0NSOM; Tue, 23 Jul 2024 13:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D223060886
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D223060886;
	Tue, 23 Jul 2024 13:40:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A6061BF2F5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23D51401B6
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKd26P8PpzEe for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 13:40:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 965C8401B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 965C8401B5
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 965C8401B5
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:40:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.125.116]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mof9P-1rynf31j8T-00faI0; Tue, 23
 Jul 2024 15:40:12 +0200
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 15:39:46 +0200
Message-ID: <20240723133951.3542206-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723133951.3542206-1-fiona.klute@gmx.de>
References: <20240723133951.3542206-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:I5kCVFllt1cF8mLaP3+sMvjK9pY0xgaTtRy0Qry/sE3o2k3lfyM
 0c0XX2VgIewzBoXxakG/S+OPeLukbJa3hg0eTyAHPwlOLsTQi7RXRlVNQ1D3ACxBFL2BrKS
 +iI08uWX6jGcuo5LlrYX8X4EUnANY8+Iel+sST26SvmggFhMRmXjGD9jvoWLSrOHgxqtKxr
 2dGkfANgtQRqesSWPmnqw==
UI-OutboundReport: notjunk:1;M01:P0:eEP7fub+oPM=;J/e1FZwMHs1XQ7C+e2ND5BlArHL
 Njj9PciBfPY7wC7VU8bHWUI9P7gjKOey5eZUAjnazlcmgEZi6pK98T+vsNcSTPwpPkYmUjQIR
 pHBjUIHump3wmmcFDOZU2IO4VYPUlnnzqaYavf5kt+tYE4DZdqjSxwmbW5oy34BAIZP6UeSiS
 o+LLB0ywe9RLefF1XYZMSJQg957gWPK9rXz4bqcOCEPGSw4QhLckl026xkVPuVSjjCr3yGire
 7v292LNM7xhIz6QhMDhap+Chr9RMmpf8hXm5EflpxfHEnuFXCnQni95qLFnIUyClsQ/qyoz1u
 sE3I6akuB9y6uXpzGx+lg77aUq7nOy61AYGCwL3MOmuTDafrqKMbQMWR/7MxcSkdf7j2aep4+
 w+9ZTLzhepdggKHDF62IUV5ZVSYmDwx/bjeetUQXJUBcTvlDzkZz3qrD1a9DW0p61Vi8RdWU+
 IsY5ETXg5/rMe18OZEjqSYvYKdcyd8djbksj+WeD4Mq98rWB/WNhn2wLSt7ltM3ZGyCKui7WC
 I5vWWI+tAFo0iRQ9BYhm+2EKL8DogIHJVVf6F/+0MJyH5MQJdT7GQpjvwnLa+0di1KzISeoqa
 S1xgX6lqDHzIQvsTZpExPs7xbjNVs8z8Z5OJistVJOuXOaMV6IS2B7+jw2GjpFVDKJEgIznEU
 FecJhVIxTdlxYi7E7q+ylXflODgNLjPYweUXDeRfYUsdmhC2ssTgb7ol7x6wsYofO7p667Mb8
 sFluUTEQ1VvnbMQWIOVxRy0V9ZN0DKflhqn9ickf89o8No4VXOGs2QvlHj5s2j3ok6pJBTj23
 L2E3mhEvVBCwj6rcGgfj0KGg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1721742012; x=1722346812; i=fiona.klute@gmx.de;
 bh=qJJTxKL9Lh7grpBOddrHtkG3fPJ1ONIinCD9kUtE1Xg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=FYA8StCZ5pjv9XnKYpSAQmmp8g+r06Bu47iPqnwVQIr3Q8H3pdIJe/HQ3zoPG07A
 9ckigt5s7D4uIPPQmCN1e+K+taI82XmoCWkF/EveP3FFP7dpnEd6N6loXQGHMJqGX
 Hr3nzczMT2Sssdby/WsodT5cyheMd8ybqf+IayjrwxOScXMV/lkjdqLrnrfrnj1E7
 K5BfgZEz/9LffaUe3xB2b+w7f6+sdRl48w+5ALQrkM77JQhLR+zZcifRh2bENJyQl
 YMZgdij8ZfwYtTGRxxeMe/MwLeUJf5OfahoHgy68PVVpQZysFE3qlu5SiKJEtStwz
 6w1Tj/EFuezehVxJIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=FYA8StCZ
Subject: [Buildroot] [PATCH v3 4/6] support/testing: test for nftables init
 script
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogIkZpb25hIEtsdXRlIChXSVdBKSIgPGZpb25hLmtsdXRlQGdteC5kZT4KClRoZSBuZXcg
dGVzdCBjaGVja3MgdGhhdCBhIHByZS1kZWZpbmVkIHJ1bGVzIGZpbGUgY2FuIGJlIGxvYWRlZCBh
bmQKd29ya3MgYXMgZXhwZWN0ZWQsIGFuZCB0aGF0IGFmdGVyIGZsdXNoaW5nIHRoZSBibG9ja2Vk
IElQIHJlc3BvbmRzIHRvCnBpbmcgYWdhaW4uCgpTaWduZWQtb2ZmLWJ5OiBGaW9uYSBLbHV0ZSAo
V0lXQSkgPGZpb25hLmtsdXRlQGdteC5kZT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiAuLi4vdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfbmZ0YWJsZXMucHkgICAgfCAzNyArKysrKysrKysrKysrKysrKystCiAuLi4vcm9vdGZzLW92
ZXJsYXkvZXRjL25mdGFibGVzLmNvbmYgICAgICAgICAgfCAgOCArKysrCiAzIGZpbGVzIGNoYW5n
ZWQsIDQ1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFibGVzL3Jvb3Rmcy1vdmVybGF5
L2V0Yy9uZnRhYmxlcy5jb25mCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMK
aW5kZXggMzY1MDMyMWQ2Zi4uMzY0MThmOWQ2ZiAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysg
Yi9ERVZFTE9QRVJTCkBAIC0xMTA4LDYgKzExMDgsNyBAQCBGOglwYWNrYWdlL3B5dGhvbi1weW1v
ZGJ1cy8KIE46CUZpb25hIEtsdXRlIDxmaW9uYS5rbHV0ZUBnbXguZGU+CiBGOglwYWNrYWdlL3B5
dGhvbi1weWFzeW5jaGF0LwogRjoJcGFja2FnZS9weXRob24tcHlhc3luY29yZS8KK0Y6CXN1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmZ0YWJsZXMucHkKCiBOOglGbMOhdmlvIFRh
cGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KIEY6CWNvbmZpZ3MvYXN1c190
aW5rZXItc19yazMyODhfZGVmY29uZmlnCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X25mdGFibGVzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF9uZnRhYmxlcy5weQppbmRleCAxNDJlN2QwMzUyLi4yNjIyYzdlODIyIDEwMDY0NAot
LS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFibGVzLnB5CisrKyBi
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmZ0YWJsZXMucHkKQEAgLTg1LDcg
Kzg1LDcgQEAgY2xhc3MgVGVzdE5mdGFibGVzKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6CiAgICAg
ICAgICMgc3VwcG9zZWQgdG8gZmFpbCBlYXJsaWVyIGlzIG5vdyBzdXBwb3NlZCB0byBzdWNjZWVk
LgogICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKHBpbmdfdGVzdF9jbWQpCgotICAgIGRlZiB0ZXN0
X3J1bihzZWxmKToKKyAgICBkZWYgYm9vdF92bShzZWxmKToKICAgICAgICAgaW1nID0gb3MucGF0
aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAicm9vdGZzLmNwaW8uZ3oiKQogICAgICAg
ICBrZXJuID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAiSW1hZ2UiKQog
ICAgICAgICBzZWxmLmVtdWxhdG9yLmJvb3QoYXJjaD0iYWFyY2g2NCIsCkBAIC05Nyw2ICs5Nyw5
IEBAIGNsYXNzIFRlc3ROZnRhYmxlcyhpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIi1pbml0cmQiLCBpbWddKQogICAgICAgICBzZWxm
LmVtdWxhdG9yLmxvZ2luKCkKCisgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgorICAgICAgICBzZWxm
LmJvb3Rfdm0oKQorCiAgICAgICAgICMgV2UgY2hlY2sgdGhlIHByb2dyYW0gY2FuIGV4ZWN1dGUu
CiAgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soIm5mdCAtLXZlcnNpb24iKQoKQEAgLTEwNywzICsx
MTAsMzUgQEAgY2xhc3MgVGVzdE5mdGFibGVzKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6CiAgICAg
ICAgICMgV2UgcnVuIGFnYWluIHRoZSBzYW1lIHRlc3Qgc2VxdWVuY2UgdXNpbmcgb3VyIHNpbXBs
ZSBuZnQKICAgICAgICAgIyBweXRob24gaW1wbGVtZW50YXRpb24sIHRvIGNoZWNrIHRoZSBsYW5n
dWFnZSBiaW5kaW5ncy4KICAgICAgICAgc2VsZi5uZnRhYmxlc190ZXN0KHByb2c9Ii9yb290L25m
dC5weSIpCisKKworY2xhc3MgVGVzdE5mdGFibGVzSW5pdChUZXN0TmZ0YWJsZXMpOgorICAgIGNv
bmZpZyA9IFRlc3ROZnRhYmxlcy5jb25maWcgKyBcCisgICAgICAgICIiIgorICAgICAgICBCUjJf
SU5JVF9CVVNZQk9YPXkKKyAgICAgICAgIiIiCisKKyAgICBkZWYgdGVzdF9ydW4oc2VsZik6Cisg
ICAgICAgIHNlbGYuYm9vdF92bSgpCisKKyAgICAgICAgIyBzdGFydCB3aXRoIGtub3duIHN0YXRl
IChydWxlcyBmcm9tIC9ldGMvbmZ0YWJsZXMuY29uZikKKyAgICAgICAgc2VsZi5hc3NlcnRSdW5P
aygiL2V0Yy9pbml0LmQvUzM1bmZ0YWJsZXMgcmVsb2FkIikKKworICAgICAgICAjIFNhbWUgY29u
Y2VwdCBhcyBpbiBUZXN0TmZ0YWJsZXMubmZ0YWJsZXNfdGVzdDogVGhlIHJ1bGVzCisgICAgICAg
ICMgc2hvdWxkIGFsbG93IHBpbmcgdG8gMTI3LjAuMC4xLCBidXQgbm90IDEyNy4wLjAuMi4KKyAg
ICAgICAgcGluZ19jbWRfcHJlZml4ID0gInBpbmcgLWMgMyAtaSAwLjUgLVcgMiAiCisgICAgICAg
IHNlbGYuYXNzZXJ0UnVuT2socGluZ19jbWRfcHJlZml4ICsgIjEyNy4wLjAuMSIpCisgICAgICAg
IF8sIGV4aXRfY29kZSA9IHNlbGYuZW11bGF0b3IucnVuKHBpbmdfY21kX3ByZWZpeCArICIxMjcu
MC4wLjIiKQorICAgICAgICBzZWxmLmFzc2VydE5vdEVxdWFsKGV4aXRfY29kZSwgMCkKKworICAg
ICAgICAjIFN0b3Agc2hvdWxkIGZsdXNoIHRoZSBydWxlcywgcGluZyB0byBib3RoIGFkZHJlc3Nl
cyBzaG91bGQKKyAgICAgICAgIyB3b3JrIG5vdy4KKyAgICAgICAgc2VsZi5hc3NlcnRSdW5Paygi
L2V0Yy9pbml0LmQvUzM1bmZ0YWJsZXMgc3RvcCIpCisgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2so
cGluZ19jbWRfcHJlZml4ICsgIjEyNy4wLjAuMSIpCisgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2so
cGluZ19jbWRfcHJlZml4ICsgIjEyNy4wLjAuMiIpCisKKyAgICAgICAgIyBTdGFydCBpcyBlc3Nl
bnRpYWxseSB0aGUgc2FtZSBhcyByZWxvYWQsIGNoZWNrIHRoYXQKKyAgICAgICAgIyAxMjcuMC4w
LjIgZ2V0cyBibG9ja2VkIGFnYWluLgorICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKCIvZXRjL2lu
aXQuZC9TMzVuZnRhYmxlcyBzdGFydCIpCisgICAgICAgIF8sIGV4aXRfY29kZSA9IHNlbGYuZW11
bGF0b3IucnVuKHBpbmdfY21kX3ByZWZpeCArICIxMjcuMC4wLjIiKQorICAgICAgICBzZWxmLmFz
c2VydE5vdEVxdWFsKGV4aXRfY29kZSwgMCkKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfbmZ0YWJsZXMvcm9vdGZzLW92ZXJsYXkvZXRjL25mdGFibGVzLmNv
bmYgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFibGVzL3Jvb3Rmcy1v
dmVybGF5L2V0Yy9uZnRhYmxlcy5jb25mCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAuLmEwNGFmMWQ2MzQKLS0tIC9kZXYvbnVsbAorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X25mdGFibGVzL3Jvb3Rmcy1vdmVybGF5L2V0Yy9uZnRhYmxlcy5jb25m
CkBAIC0wLDAgKzEsOCBAQAorZmx1c2ggcnVsZXNldAorCit0YWJsZSBpbmV0IGZpbHRlciB7CisJ
Y2hhaW4gaW5wdXQgeworCQl0eXBlIGZpbHRlciBob29rIGlucHV0IHByaW9yaXR5IGZpbHRlcjsg
cG9saWN5IGFjY2VwdDsKKwkJaXAgZGFkZHIgMTI3LjAuMC4yIGljbXAgdHlwZSBlY2hvLXJlcXVl
c3QgZHJvcAorCX0KK30KLS0KMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
