Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F7CC54798
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 13:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23F73820D7;
	Thu,  7 Mar 2024 13:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SsF_luOfkzig; Thu,  7 Mar 2024 13:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 349D582149
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 349D582149;
	Thu,  7 Mar 2024 13:06:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA0AB1BF5A4
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 13:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C734B82149
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 13:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ul8SeFcgSjP7 for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 13:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 404FA820D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 404FA820D7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 404FA820D7
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 13:05:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E92271BF209;
 Thu,  7 Mar 2024 13:05:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1riDRc-003Qq0-13;
 Thu, 07 Mar 2024 14:05:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240306192604.381763-1-fontaine.fabrice@gmail.com>
Date: Thu, 07 Mar 2024 14:05:56 +0100
In-Reply-To: <20240306192604.381763-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 6 Mar 2024 20:26:04 +0100")
Message-ID: <87wmqew5sb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
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
b20gZXNwLWhvc3RlZCB0byBsaW51eC5tawoKQ29tbWl0dGVkLCB0aGFua3MuCgotLSAKQnllLCBQ
ZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
