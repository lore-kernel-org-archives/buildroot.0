Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F19C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 22:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28481808A8;
	Sun, 15 Sep 2024 22:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uVxdMFe-59Af; Sun, 15 Sep 2024 22:15:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E10A81128
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E10A81128;
	Sun, 15 Sep 2024 22:15:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0931BF301
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CCDA40247
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anEkhgBUd9Sj for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 22:15:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2985400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2985400A4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2985400A4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 22:15:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEF8320003;
 Sun, 15 Sep 2024 22:15:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1spxWU-006QEW-2M;
 Mon, 16 Sep 2024 00:15:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
References: <20240909172542.29995-1-flavio.tapajos@newtesc.com.br>
Date: Mon, 16 Sep 2024 00:15:14 +0200
In-Reply-To: <20240909172542.29995-1-flavio.tapajos@newtesc.com.br>
 (=?utf-8?Q?=22Fl=C3=A1vio=09Tapaj=C3=B3s=22's?= message of "Mon, 9 Sep 2024
 14:25:42 -0300")
Message-ID: <87bk0owolp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/mosquitto: add dynamic security
 plugin option
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkZsw6F2aW8iID09IEZsw6F2aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rl
c2MuY29tLmJyPiB3cml0ZXM6CgogPiBTaWduZWQtb2ZmLWJ5OiBGbMOhdmlvIFRhcGFqw7NzIDxm
bGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KID4gLS0tCiA+ICBwYWNrYWdlL21vc3F1aXR0
by9Db25maWcuaW4gICAgfCAxMCArKysrKysrKysrCiA+ICBwYWNrYWdlL21vc3F1aXR0by9tb3Nx
dWl0dG8ubWsgfCAgNCArKysrCiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykK
CiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21vc3F1aXR0by9Db25maWcuaW4gYi9wYWNrYWdlL21v
c3F1aXR0by9Db25maWcuaW4KID4gaW5kZXggOGJlZGYyYWQyMS4uNzFlZWEyNTZiMyAxMDA2NDQK
ID4gLS0tIGEvcGFja2FnZS9tb3NxdWl0dG8vQ29uZmlnLmluCiA+ICsrKyBiL3BhY2thZ2UvbW9z
cXVpdHRvL0NvbmZpZy5pbgogPiBAQCAtMjksNiArMjksMTYgQEAgY29uZmlnIEJSMl9QQUNLQUdF
X01PU1FVSVRUT19CUk9LRVIKID4gIAloZWxwCiA+ICAJICBCdWlsZCBhbmQgaW5zdGFsbCB0aGUg
bW9zcXVpdHRvIGJyb2tlciBvbnRvIHRhcmdldC4KIAogPiArY29uZmlnIEJSMl9QQUNLQUdFX01P
U1FVSVRUT19CUk9LRVJfRFlOQU1JQ19TRUNVUklUWV9QTFVHSU4KID4gKwlib29sICJkeW5hbWlj
IHNlY3VyaXR5IHBsdWdpbiIKID4gKwlkZWZhdWx0IG4KCiduJyBpcyB0aGUgZGVmYXVsdCBvcHRp
b24sIHNvIEkndmUgZHJvcHBlZCB0aGlzIGFuZCBjb21taXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUs
IFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
