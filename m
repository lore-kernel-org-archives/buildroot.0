Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC579C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAA3560A5A;
	Mon,  3 Jun 2024 07:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00Z6oht8ChmB; Mon,  3 Jun 2024 07:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 953D860724
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 953D860724;
	Mon,  3 Jun 2024 07:18:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1CAC1BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ED2484247
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXqHM0DqnA5A for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:17:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF6B884240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF6B884240
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF6B884240
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:17:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA9AAFF80F;
 Mon,  3 Jun 2024 07:17:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sE1wk-002Ebx-1R;
 Mon, 03 Jun 2024 09:17:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 09:17:16 +0200
Message-Id: <20240603071726.532652-13-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603071726.532652-1-peter@korsgaard.com>
References: <20240603071726.532652-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 13/23] package/ncftp: use https:// _SITE
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGZ0cCBzZXJ2ZXIgZG9lcyBub3QgcmVzcG9uZCwgc28gY2hhbmdlIHRvIGh0dHBzOi8vIGlu
c3RlYWQuICBIZXJlIHRoZQozLjIuNiB2ZXJzaW9uIGlzIHVuZGVyIG9sZGVyX3ZlcnNpb25zLgoK
d2dldCBmdHA6Ly9mdHAubmNmdHAuY29tL25jZnRwL25jZnRwLTMuMi42LXNyYy50YXIuZ3oKLS0y
MDI0LTA2LTAzIDA4OjEwOjQ0LS0gIGZ0cDovL2Z0cC5uY2Z0cC5jb20vbmNmdHAvbmNmdHAtMy4y
LjYtc3JjLnRhci5negogICAgICAgICAgID0+IOKAmG5jZnRwLTMuMi42LXNyYy50YXIuZ3rigJkK
UmVzb2x2aW5nIGZ0cC5uY2Z0cC5jb20gKGZ0cC5uY2Z0cC5jb20pLi4uIDIwOS4xOTcuMTAyLjM4
CkNvbm5lY3RpbmcgdG8gZnRwLm5jZnRwLmNvbSAoZnRwLm5jZnRwLmNvbSl8MjA5LjE5Ny4xMDIu
Mzh8OjIxLi4uIF5DCgpodHRwIHJlZGlyZWN0cyB0byBodHRwcywgc28gdXBkYXRlIHRoZSBoZWxw
IHRleHQgdG8gbWF0Y2guCgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtv
cnNnYWFyZC5jb20+Ci0tLQogcGFja2FnZS9uY2Z0cC9Db25maWcuaW4gfCAyICstCiBwYWNrYWdl
L25jZnRwL25jZnRwLm1rICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmNmdHAvQ29uZmlnLmluIGIv
cGFja2FnZS9uY2Z0cC9Db25maWcuaW4KaW5kZXggNmE5MzlhYTg4Yy4uYzg4NzBhM2RkZSAxMDA2
NDQKLS0tIGEvcGFja2FnZS9uY2Z0cC9Db25maWcuaW4KKysrIGIvcGFja2FnZS9uY2Z0cC9Db25m
aWcuaW4KQEAgLTcsNyArNyw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9OQ0ZUUAogCSAgYXBwbGlj
YXRpb24gcHJvZ3JhbXMgaW1wbGVtZW50aW5nIHRoZSBGaWxlIFRyYW5zZmVyIFByb3RvY29sCiAJ
ICAoRlRQKS4KIAotCSAgaHR0cDovL3d3dy5uY2Z0cC5jb20vbmNmdHAvCisJICBodHRwczovL3d3
dy5uY2Z0cC5jb20vbmNmdHAvCiAKIGlmIEJSMl9QQUNLQUdFX05DRlRQCiAKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvbmNmdHAvbmNmdHAubWsgYi9wYWNrYWdlL25jZnRwL25jZnRwLm1rCmluZGV4IDY3
NmE5YzU4OTUuLmQzODBlYmFlMDIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbmNmdHAvbmNmdHAubWsK
KysrIGIvcGFja2FnZS9uY2Z0cC9uY2Z0cC5tawpAQCAtOCw3ICs4LDcgQEAgTkNGVFBfVkVSU0lP
TiA9IDMuMi42CiAjIHVzZSAuZ3ogYXMgdXBzdHJlYW0gLnh6IHRhcmJhbGwgaGFzIGNoYW5nZWQg
YWZ0ZXIgdGhlIGhhc2ggd2FzIGFkZGVkIGZvcgogIyAyMDE3LjAyLiBDYW4gYmUgY2hhbmdlZCBi
YWNrIHRvIC54eiB3aGVuIHZlcnNpb24gaXMgYnVtcGVkCiBOQ0ZUUF9TT1VSQ0UgPSBuY2Z0cC0k
KE5DRlRQX1ZFUlNJT04pLXNyYy50YXIuZ3oKLU5DRlRQX1NJVEUgPSBmdHA6Ly9mdHAubmNmdHAu
Y29tL25jZnRwCitOQ0ZUUF9TSVRFID0gaHR0cHM6Ly93d3cubmNmdHAuY29tL3B1YmxpY19mdHAv
bmNmdHAvb2xkZXJfdmVyc2lvbnMKIE5DRlRQX1RBUkdFVF9CSU5TID0gbmNmdHAKIE5DRlRQX0xJ
Q0VOU0UgPSBDbGFyaWZpZWQgQXJ0aXN0aWMgTGljZW5zZQogTkNGVFBfTElDRU5TRV9GSUxFUyA9
IGRvYy9MSUNFTlNFLnR4dAotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
