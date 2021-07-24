Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38888C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:55:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7C0D60E97
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7C0D60E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF7066070D;
	Sat, 24 Jul 2021 07:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C26KtBZQ4UnR; Sat, 24 Jul 2021 07:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 256A6606D5;
	Sat, 24 Jul 2021 07:55:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60D051BF4D6
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50B6840617
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_DmOd_8eVU4 for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 07:55:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 540AB4060F
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 07:55:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id CEB16E0006;
 Sat, 24 Jul 2021 07:55:13 +0000 (UTC)
Date: Sat, 24 Jul 2021 09:55:10 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20210724095510.1ba9f283@windsurf>
In-Reply-To: <20210723164235.17643-1-ps.report@gmx.net>
References: <20210723164235.17643-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/qt5base: select mandatory
 libopenssl PSK feature
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

T24gRnJpLCAyMyBKdWwgMjAyMSAxODo0MjozNSArMDIwMApQZXRlciBTZWlkZXJlciA8cHMucmVw
b3J0QGdteC5uZXQ+IHdyb3RlOgoKPiBGaXhlczoKPiAKPiAgIC0gaHR0cDovL2F1dG9idWlsZC5i
dWlsZHJvb3QubmV0L3Jlc3VsdHMvMjQyMzAyNDJjMTVlYjM3OWQ2NTNjOTU3YTA4NjIxZjhhMWZh
YzU1ZQo+IAo+ICAgc3NsL3FkdGxzX29wZW5zc2wuY3BwOiBJbiBtZW1iZXIgZnVuY3Rpb24g4oCY
Ym9vbCBkdGxzb3BlbnNzbDo6RHRsc1N0YXRlOjppbml0Q3R4QW5kQ29ubmVjdGlvbihRRHRsc0Jh
c2VQcml2YXRlKinigJk6Cj4gICBzc2wvcWR0bHNfb3BlbnNzbC5jcHA6NzE3Ojk6IGVycm9yOiDi
gJhxX1NTTF9zZXRfcHNrX3NlcnZlcl9jYWxsYmFja+KAmSB3YXMgbm90IGRlY2xhcmVkIGluIHRo
aXMgc2NvcGU7IGRpZCB5b3UgbWVhbiDigJhxX1NTTF9zZXRfcHNrX3VzZV9zZXNzaW9uX2NhbGxi
YWNr4oCZPwo+ICAgICA3MTcgfCAgICAgICAgIHFfU1NMX3NldF9wc2tfc2VydmVyX2NhbGxiYWNr
KG5ld0Nvbm5lY3Rpb24uZGF0YSgpLCBkdGxzY2FsbGJhY2tzOjpxX1BTS19zZXJ2ZXJfY2FsbGJh
Y2spOwo+ICAgICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4g
ICAgICAgICB8ICAgICAgICAgcV9TU0xfc2V0X3Bza191c2Vfc2Vzc2lvbl9jYWxsYmFjawo+ICAg
c3NsL3FkdGxzX29wZW5zc2wuY3BwOjcxOTo5OiBlcnJvcjog4oCYcV9TU0xfc2V0X3Bza19jbGll
bnRfY2FsbGJhY2vigJkgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlOyBkaWQgeW91IG1l
YW4g4oCYcV9TU0xfc2V0X3Bza191c2Vfc2Vzc2lvbl9jYWxsYmFja+KAmT8KPiAgICAgNzE5IHwg
ICAgICAgICBxX1NTTF9zZXRfcHNrX2NsaWVudF9jYWxsYmFjayhuZXdDb25uZWN0aW9uLmRhdGEo
KSwgZHRsc2NhbGxiYWNrczo6cV9QU0tfY2xpZW50X2NhbGxiYWNrKTsKPiAgICAgICAgIHwgICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgICAgICAgfCAgICAgICAgIHFf
U1NMX3NldF9wc2tfdXNlX3Nlc3Npb25fY2FsbGJhY2sKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRl
ciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Cj4gLS0tCj4gIHBhY2thZ2UvcXQ1L3F0NWJh
c2UvQ29uZmlnLmluIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RP
LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9i
b290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlz
dHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
