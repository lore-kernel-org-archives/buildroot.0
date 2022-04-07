Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6CCC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 19:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCED28408B;
	Thu,  7 Apr 2022 19:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DhCTAZdK9FIW; Thu,  7 Apr 2022 19:54:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED5C984059;
	Thu,  7 Apr 2022 19:54:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F0761BF282
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 19:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D2D561220
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 19:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3aUGOT94BYhm for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 19:54:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 482D560E83
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 19:54:36 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3E424100002;
 Thu,  7 Apr 2022 19:54:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ncYDA-000dal-5E; Thu, 07 Apr 2022 21:54:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20220331201231.26526-1-ps.report@gmx.net>
Date: Thu, 07 Apr 2022 21:54:32 +0200
In-Reply-To: <20220331201231.26526-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Thu, 31 Mar 2022 22:12:31 +0200")
Message-ID: <87wng0u0sn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/libcamera-apps: fix X11 preview
 compile (conversion from Window to EGLNativeWindowType)
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

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IHdyaXRl
czoKCiA+IC0gYWRkIDAwMi1wcmV2aWV3LWZpeC1lZ2xfcHJldmlldy1jb21waWxlLWNvbnZlcnNp
b24tZnJvbS1XaW5kLnBhdGNoCiA+IEZpeGVzOgoKID4gICAuLi4vYnVpbGQvbGliY2FtZXJhLWFw
cHMtMmQxMDA5ZTNiYWRjYzgwNDczNjFmZjgxMTQ5YWQ2Y2JhM2I5MTFiNS9wcmV2aWV3L2VnbF9w
cmV2aWV3LmNwcDozMjk6Njk6IGVycm9yOiBpbnZhbGlkIGNvbnZlcnNpb24gZnJvbSDigJhXaW5k
b3figJkge2FrYSDigJhsb25nIHVuc2lnbmVkIGludOKAmX0gdG8g4oCYRUdMTmF0aXZlV2luZG93
VHlwZeKAmSB7YWthIOKAmGZiZGV2X3dpbmRvdyrigJl9IFstZnBlcm1pc3NpdmVdCiA+ICAgICAz
MjkgfCAgICAgICAgIGVnbF9zdXJmYWNlXyA9IGVnbENyZWF0ZVdpbmRvd1N1cmZhY2UoZWdsX2Rp
c3BsYXlfLCBjb25maWcsIHdpbmRvd18sIE5VTEwpOwogPiAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+CiA+ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKID4gICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
V2luZG93CiA+ICAgICAgICAgfCB7YWthIGxvbmcgdW5zaWduZWQgaW50fQoKID4gU2lnbmVkLW9m
Zi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgogPiAtLS0KID4gQ2hhbmdl
cyB2MSAtPiB2MjoKID4gICAtIGFkZCBwYXRjaCB3aXRoIHByb3BlciB0eXBlIGNhc3QgaW5zdGVh
ZCBvZiAnLWZwZXJtaXNzaXZlJyBjb21waWxlcgogPiAgICAgY29tbWFuZCBsaW5lIG9wdGlvbiAo
c3VnZ2VzdGVkIGJ5IEFybm91dCBWYW5kZWNhcHBlbGxlKQoKQ29tbWl0dGVkIHRvIDIwMjIuMDIu
eCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
