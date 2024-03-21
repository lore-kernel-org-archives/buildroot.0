Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CD9C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 20:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C85E2822B6;
	Thu, 21 Mar 2024 20:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UqfxvUVRRyKS; Thu, 21 Mar 2024 20:13:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E90B5822BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E90B5822BA;
	Thu, 21 Mar 2024 20:13:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B77621BF2BD
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 20:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F7B5417AF
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 20:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oMsnFQp02nju for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 20:13:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1290D400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1290D400C1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1290D400C1
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 20:13:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FD7740006;
 Thu, 21 Mar 2024 20:13:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rnOmZ-005WHV-2C;
 Thu, 21 Mar 2024 21:12:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240306192604.381763-1-fontaine.fabrice@gmail.com>
Date: Thu, 21 Mar 2024 21:12:59 +0100
In-Reply-To: <20240306192604.381763-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 6 Mar 2024 20:26:04 +0100")
Message-ID: <874jcz8htg.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,1/1] linux: disable -Werror
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBEaXNhYmxlIC1XZXJyb3IgdG8gZml4IHRoZSBmb2xsb3dpbmcg
YnVpbGQgZmFpbHVyZSB3aXRoIGVzcC1ob3N0ZWQKID4gcmFpc2VkIGF0IGxlYXN0IHNpbmNlIGNv
bW1pdCBhMzgyYTdkNTU0MzI5MThkMmExZTQ3YWU0Y2JlN2VkNTBmYTE3YTA4OgoKID4gSW4gZnVu
Y3Rpb24g4oCYZGVzdHJveV9jbWRfd3HigJksCiA+ICAgICBpbmxpbmVkIGZyb20g4oCYZXNwX2Nv
bW1hbmRzX3RlYXJkb3du4oCZIGF0IC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2Ut
NC9vdXRwdXQtMS9idWlsZC9lc3AtaG9zdGVkLWNlM2M1MGEzM2ZhNGJjNTYyYTFiNmNiY2VlMjky
YzFhZTBiMGE0MDQvZXNwX2hvc3RlZF9uZy9ob3N0L2VzcF9jbWQuYzoxNDY3OjI6CiA+IC4vaW5j
bHVkZS9saW51eC93b3JrcXVldWUuaDo2Mzk6OTogZXJyb3I6IGNhbGwgdG8g4oCYX193YXJuX2Zs
dXNoaW5nX3N5c3RlbXdpZGVfd3HigJkgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUgd2FybmluZzog
UGxlYXNlIGF2b2lkIGZsdXNoaW5nIHN5c3RlbS13aWRlIHdvcmtxdWV1ZXMuIFstV2Vycm9yPWF0
dHJpYnV0ZS13YXJuaW5nXQogPiAgIDYzOSB8ICAgICAgICAgX193YXJuX2ZsdXNoaW5nX3N5c3Rl
bXdpZGVfd3EoKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKID4gICAgICAgfCAg
ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KID4gL2hvbWUvYXV0b2J1aWxk
L2F1dG9idWlsZC9pbnN0YW5jZS00L291dHB1dC0xL2J1aWxkL2VzcC1ob3N0ZWQtY2UzYzUwYTMz
ZmE0YmM1NjJhMWI2Y2JjZWUyOTJjMWFlMGIwYTQwNC9lc3BfaG9zdGVkX25nL2hvc3QvZXNwX2Nt
ZC5jOjQwODoxNzoKID4gbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGZsdXNoX3NjaGVk
dWxlZF93b3Jr4oCZCiA+ICAgNDA4IHwgICAgICAgICAgICAgICAgIGZsdXNoX3NjaGVkdWxlZF93
b3JrKCk7CiA+ICAgICAgIHwgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+Cgog
PiBGaXhlczoKID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNmFj
N2E0NjAxOTM4ZDMyOTZlZDE2NTdjMDZmOGNkZjQzMzc1N2Q3MwogPiAgLSBodHRwOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy83OTk3Y2M4YTY3NjQ1YTZlMWNmNGUyNGQxNzJjNmZl
YWU0NTlkY2ZiCgogPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5m
YWJyaWNlQGdtYWlsLmNvbT4KID4gLS0tCiA+IENoYW5nZXMgdjEgLT4gdjIgKGFmdGVyIHJldmll
dyBvZiBQZXRlciBLb3JzZ2FhcmQpOgogPiAgLSBNb3ZlIGRpc2FibGluZyBvZiAtV2Vycm9yIGZy
b20gZXNwLWhvc3RlZCB0byBsaW51eC5tawoKQ29tbWl0dGVkIHRvIDIwMjQuMDIueCwgdGhhbmtz
LgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
