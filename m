Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDAFC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 244656071F;
	Mon,  3 Jun 2024 07:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMpzBRdfqFtX; Mon,  3 Jun 2024 07:18:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFA4060A45
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFA4060A45;
	Mon,  3 Jun 2024 07:18:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C8A91BF861
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47F3C40010
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RA8H017p3LNf for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:17:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C2E9A4042D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2E9A4042D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2E9A4042D
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:17:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7011FF807;
 Mon,  3 Jun 2024 07:17:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sE1wj-002Ebp-2z;
 Mon, 03 Jun 2024 09:17:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 09:17:15 +0200
Message-Id: <20240603071726.532652-12-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603071726.532652-1-peter@korsgaard.com>
References: <20240603071726.532652-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 12/23] package/lynx: use http:// _SITE
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
Cc: Mario Lang <mlang@blind.guru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGZ0cCBzZXJ2ZXIgZG9lcyBub3QgYWxsb3cgYW5vbnltb3VzIGxvZ2luLCBjYXVzaW5nIHRo
ZSBkb3dubG9hZCB0byBmYWlsOgoKd2dldCAtLXBhc3NpdmUtZnRwIC1uZCAtdCAzIC1PICcvaG9t
ZS9wZWtvL3NvdXJjZS9idWlsZHJvb3Qvb3V0cHV0LXF0L2J1aWxkLy5seW54Mi44LjlyZWwuMS50
YXIuYnoyLlhsY2RDSy9vdXRwdXQnICdmdHA6Ly9mdHAuaW52aXNpYmxlLWlzbGFuZC5uZXQvbHlu
eC90YXJiYWxscy9seW54Mi44LjlyZWwuMS50YXIuYnoyJwotLTIwMjQtMDYtMDIgMjI6MjE6NDkt
LSAgZnRwOi8vZnRwLmludmlzaWJsZS1pc2xhbmQubmV0L2x5bngvdGFyYmFsbHMvbHlueDIuOC45
cmVsLjEudGFyLmJ6MgogICAgICAgICAgID0+IOKAmC9ob21lL3Bla28vc291cmNlL2J1aWxkcm9v
dC9vdXRwdXQtcXQvYnVpbGQvLmx5bngyLjguOXJlbC4xLnRhci5iejIuWGxjZENLL291dHB1dOKA
mQpSZXNvbHZpbmcgZnRwLmludmlzaWJsZS1pc2xhbmQubmV0IChmdHAuaW52aXNpYmxlLWlzbGFu
ZC5uZXQpLi4uIDIxNi4xOTQuMjUzLjI5CkNvbm5lY3RpbmcgdG8gZnRwLmludmlzaWJsZS1pc2xh
bmQubmV0IChmdHAuaW52aXNpYmxlLWlzbGFuZC5uZXQpfDIxNi4xOTQuMjUzLjI5fDoyMS4uLiBj
b25uZWN0ZWQuCkxvZ2dpbmcgaW4gYXMgYW5vbnltb3VzIC4uLgpMb2dpbiBpbmNvcnJlY3QuCgpM
dWNraWx5IHRoZSB0YXJiYWxsIGlzIGFsc28gYXZhaWxhYmxlIG92ZXIgaHR0cDovLywgc28gdXNl
IHRoYXQgaW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4KLS0tCiBwYWNrYWdlL2x5bngvbHlueC5tayB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bHlueC9seW54Lm1rIGIvcGFja2FnZS9seW54L2x5bngubWsKaW5kZXggZGE1N2ViMjYwMS4uNDFm
OTE2MWYxMCAxMDA2NDQKLS0tIGEvcGFja2FnZS9seW54L2x5bngubWsKKysrIGIvcGFja2FnZS9s
eW54L2x5bngubWsKQEAgLTYsNyArNiw3IEBACiAKIExZTlhfVkVSU0lPTiA9IDIuOC45cmVsLjEK
IExZTlhfU09VUkNFID0gbHlueCQoTFlOWF9WRVJTSU9OKS50YXIuYnoyCi1MWU5YX1NJVEUgPSBm
dHA6Ly9mdHAuaW52aXNpYmxlLWlzbGFuZC5uZXQvbHlueC90YXJiYWxscworTFlOWF9TSVRFID0g
aHR0cDovL2ludmlzaWJsZS1taXJyb3IubmV0L2FyY2hpdmVzL2x5bngvdGFyYmFsbHMvCiBMWU5Y
X1BBVENIID0gXAogCWh0dHBzOi8vc2Fsc2EuZGViaWFuLm9yZy9seW54LXRlYW0vbHlueC8tL3Jh
dy9kZWJpYW4vMi45LjBkZXYuNi0zX2RlYjExdTEvZGViaWFuL3BhdGNoZXMvOTBfQ1ZFLTIwMjEt
MzgxNjUucGF0Y2gKICMgOTBfQ1ZFLTIwMjEtMzgxNjUucGF0Y2gKLS0gCjIuMzkuMgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
