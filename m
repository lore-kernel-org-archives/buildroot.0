Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAECC25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 13:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84E5781A58;
	Wed, 15 May 2024 13:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOBBOt8ocT45; Wed, 15 May 2024 13:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7506281A73
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7506281A73;
	Wed, 15 May 2024 13:22:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 190521BF2C2
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 13:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 062A3606A7
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 13:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5emVwNzb89J4 for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 13:22:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0876860632
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0876860632
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0876860632
 for <buildroot@buildroot.org>; Wed, 15 May 2024 13:22:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E75120008;
 Wed, 15 May 2024 13:22:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s7EaU-001D3d-2W;
 Wed, 15 May 2024 15:22:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240408211609.2423619-1-robimarko@gmail.com>
 <ZjEx5n1J7XH2Or2Q@landeda>
Date: Wed, 15 May 2024 15:22:30 +0200
In-Reply-To: <ZjEx5n1J7XH2Or2Q@landeda> (Yann E. MORIN's message of "Tue, 30
 Apr 2024 20:01:10 +0200")
Message-ID: <8734qjryzt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] kconfig/lxdialog: fix check() with
 GCC14
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
Cc: Petr Vorel <petr.vorel@gmail.com>, Robert Marko <robimarko@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IFJvYmVydCwgQWxsLAogPiBPbiAyMDI0LTA0LTA4IDIzOjE2ICswMjAwLCBSb2Jl
cnQgTWFya28gc3Bha2UgdGh1c2x5OgogPj4gR0NDMTQgbm93IHRyZWF0cyBpbXBsaWNpdCBpbnQg
dHlwZXMgYXMgZXJyb3Igc28gd2hlbiBjaGVjaygpIGZyb20KID4+IGNoZWNrLWx4ZGlhbG9nLnNo
IGlzIGNhbGxlZCB0byBjaGVjayB3aGV0aGVyIHdlIGNhbiBsaW5rIGFnYWluc3QgbmN1cnNlcwog
Pj4gaXQgd2lsbCBmYWlsIHNpbGVudGx5IGFuZCB0aGUgaGVscCB0ZXh0IGluZGljYXRpbmcgdG8g
aW5zdGFsbCBuY3Vyc2VzIGlzCiA+PiBwcmludGVkLgogPj4gCiA+PiBIb3dldmVyLCB0aGlzIGlz
IG5vdCBkdWUgdG8gbWlzc2luZyBuY3Vyc2VzIGJ1dCBvbmNlIHRoZSBzdGRlcnIgcmVkaXJlY3QK
ID4+IHRvIC9kZXYvbnVsbCBpcyByZW1vdmVkIHdlIGNhbiBzZWUgdGhlIHJvb3QgY2F1c2U6CiA+
PiA8c3RkaW4+OjI6MTogZXJyb3I6IHJldHVybiB0eXBlIGRlZmF1bHRzIHRvIOKAmGludOKAmSBb
LVdpbXBsaWNpdC1pbnRdCiA+PiAKID4+IFNvLCBpbiBvcmRlciBmb3IgbWVudWNvbmZpZyB0byB3
b3JrIHdpdGggR0NDMTQgbGV0cyBqdXN0IHNwZWNpZnkgdGhlCiA+PiByZXR1cm4gdHlwZSBvZiBt
YWluKCkgYXMgaW50LgoKID4gSSd2ZSBhbHNvIGFkZGVkIGEgbGl0dGxlIG5vdGUgdGhhdCB0aGVy
ZSBpcyBubyBjb21taXQgZnJvbSB0aGUga2VybmVsCiA+IHRyZWUgdGhhdCB3ZSBjYW4gYmFja3Bv
cnQsIGJlY2F1c2UgdGhlIGtlcm5lbCB0cmVlIG5vIGxvbmdlciBoYXMgdGhhdAogPiBzY3JpcHQu
CgogPj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IE1hcmtvIDxyb2JpbWFya29AZ21haWwuY29tPgog
Pj4gUmV2aWV3ZWQtYnk6IFBldHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPgogPj4gVGVz
dGVkLWJ5OiBQZXRyIFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNvbT4KCiA+IEFwcGxpZWQgdG8g
bWFzdGVyIHdpdGggdGhlIGxpdHRsZSBub3RlIGFib3V2ZSBhZGRlZCwgdGhhbmtzLgoKQ29tbWl0
dGVkIHRvIDIwMjQuMDIueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
