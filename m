Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D65FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 07:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDCF341BB7;
	Wed, 30 Mar 2022 07:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7On5S_BIr-Rg; Wed, 30 Mar 2022 07:13:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9529841B4C;
	Wed, 30 Mar 2022 07:13:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16F6C1BF5E0
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13DCB60ACB
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AHLaTtEsfI-B for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 07:13:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2A8D60A71
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 07:13:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 719196000A;
 Wed, 30 Mar 2022 07:13:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZSWJ-00GSCe-CY; Wed, 30 Mar 2022 09:13:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20220316182440.17393-1-ps.report@gmx.net>
Date: Wed, 30 Mar 2022 09:13:31 +0200
In-Reply-To: <20220316182440.17393-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Wed, 16 Mar 2022 19:24:40 +0100")
Message-ID: <87ee2j9alg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/qt5base: fix eglconvenience
 compile (missing QList include)
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IHdyaXRl
czoKCiA+IC0gYWRkIDAwMDgtZWdsY29udmVuaWVuY2UtYWRkLW1pc3NpbmctUUxpc3QtaW5jbHVk
ZS5wYXRjaCB0byBmaXgKID4gICBlZ2xjb252ZW5pZW5jZSBjb21waWxlIChtaXNzaW5nIFFMaXN0
IGluY2x1ZGUpCgogPiBGaXhlczoKCiA+ICAgcWVnbGNvbnZlbmllbmNlLmNwcDo0MTg6MjM6IGVy
cm9yOiB2YXJpYWJsZSDigJhRTGlzdDxRQnl0ZUFycmF5PiBleHRlbnNpb25z4oCZIGhhcyBpbml0
aWFsaXplciBidXQgaW5jb21wbGV0ZSB0eXBlCiA+ICAgICA0MTggfCAgICAgUUxpc3Q8UUJ5dGVB
cnJheT4gZXh0ZW5zaW9ucyA9CiA+ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+fgogPiAgIHFlZ2xjb252ZW5pZW5jZS5jcHA6NDIwOjY1OiBlcnJvcjogaW52YWxpZCB1
c2Ugb2YgaW5jb21wbGV0ZSB0eXBlIOKAmGNsYXNzIFFMaXN0PFFCeXRlQXJyYXk+4oCZCiA+ICAg
ICA0MjAgfCAgICAgICAgICAgICAoZWdsUXVlcnlTdHJpbmcoZGlzcGxheSwgRUdMX0VYVEVOU0lP
TlMpKSkuc3BsaXQoJyAnKTsKID4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgogPiBTaWduZWQtb2ZmLWJ5
OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CgpDb21taXR0ZWQgdG8gMjAyMi4w
Mi54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
