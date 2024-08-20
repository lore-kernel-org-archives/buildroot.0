Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5D6C531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 20:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CADE740457;
	Tue, 20 Aug 2024 20:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wEd3Hg7J9Dq; Tue, 20 Aug 2024 20:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 981E2408C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 981E2408C5;
	Tue, 20 Aug 2024 20:05:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F16F51BF376
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 20:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF554408C5
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 20:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWUsH090LBo8 for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 20:05:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DAA440457
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DAA440457
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DAA440457
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 20:05:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5EAB20008;
 Tue, 20 Aug 2024 20:05:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sgV6s-000Ikm-16;
 Tue, 20 Aug 2024 22:05:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240627103440.27982-1-spersvold@gmail.com>
 <20240715112855.03e937c4@windsurf>
Date: Tue, 20 Aug 2024 22:05:42 +0200
In-Reply-To: <20240715112855.03e937c4@windsurf> (Thomas Petazzoni via
 buildroot's message of "Mon, 15 Jul 2024 11:28:55 +0200")
Message-ID: <87jzgbdko9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] dhrystone: add patch with forward
 declarations for functions
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
Cc: Steffen Persvold <spersvold@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gSGVsbG8sCiA+IE9uIFRodSwgMjcgSnVuIDIw
MjQgMTI6MzQ6NDAgKzAyMDAKID4gU3RlZmZlbiBQZXJzdm9sZCA8c3BlcnN2b2xkQGdtYWlsLmNv
bT4gd3JvdGU6CgogPj4gR0NDMTQgd2lsbCBnaXZlIGVycm9ycyBmb3IgbWlzc2luZyBmdW5jdGlv
biBkZWNsYXJhdGlvbnMgYW5kCiA+PiBtaXNzaW5nIHJldHVybiB0eXBlcyA6CiA+PiAKID4+IGRo
cnlfMS5jOjc1OjE6IGVycm9yOiByZXR1cm4gdHlwZSBkZWZhdWx0cyB0byDigJhpbnTigJkgWy1X
aW1wbGljaXQtaW50XQogPj4gNzUgfCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiA+PiB8
IF5+fn4KID4+IGRocnlfMS5jOiBJbiBmdW5jdGlvbiDigJhtYWlu4oCZOgogPj4gZGhyeV8xLmM6
MTU5OjU6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhQcm9jXzXi
gJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiA+PiAxNTkgfCAgICAgUHJvY181
KCk7CiA+PiB8ICAgICBefn5+fn4KID4+IAogPj4gU2lnbmVkLW9mZi1ieTogU3RlZmZlbiBQZXJz
dm9sZCA8c3BlcnN2b2xkQGdtYWlsLmNvbT4KID4+IC0tLQogPj4gcGFja2FnZS9kaHJ5c3RvbmUv
MDAwNi1md2QtZGVjbC5wYXRjaCB8IDEyMSArKysrKysrKysrKysrKysrKysrKysrKysrKwogPj4g
MSBmaWxlIGNoYW5nZWQsIDEyMSBpbnNlcnRpb25zKCspCiA+PiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9kaHJ5c3RvbmUvMDAwNi1md2QtZGVjbC5wYXRjaAoKID4gVGhhbmtzIGZvciB5b3Vy
IGNvbnRyaWJ1dGlvbiEKCiA+IFRoZSBwYXRjaCBhZGRlZCBieSB5b3VyIHBhdGNoIHdhcyBtaXNz
aW5nIGEgU2lnbmVkLW9mZi1ieSBsaW5lIGFuZCBhbgogPiBVcHN0cmVhbSB0YWcsIHNvIEkndmUg
YWRkZWQgdGhhdC4gQWxzbyB5b3VyIGNvbW1pdCBtZXNzYWdlIHdhcyBtaXNzaW5nCiA+IGEgcmVm
ZXJlbmNlIHRvIHRoZSBhdXRvYnVpbGRlciBmYWlsdXJlIGJlaW5nIGZpeGVkIGJ5IHRoaXMuIEkg
YWRkcmVzc2VkCiA+IGJvdGggaXNzdWVzIHdoZW4gYXBwbHlpbmcuCgogPiBJIGRpZCBhIHByZXBh
cmF0aW9uIHBhdGNoIHRvIGNsZWFuLXVwIHRoZSBleGlzdGluZyBwYXRjaGVzIGEgYml0OgoKID4g
ICBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvOTUw
MTM3NzdjZjkzNTQ4ZWVlN2FjMzAxMGI1MTNkMzU0ZThiMGEzMAoKID4gQW5kIHRoZW4gYXBwbGll
ZCB5b3VyIHBhdGNoIHdpdGggdGhlIGZpeGVzIGRlc2NyaWJlZCBhYm92ZToKCiA+ICAgaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzM4NDdhMTQ1YzIz
MjM0YjNiZGRhZTNhOWNlYjlkMmQ0ZTZhOTBmYzUKCiA+IFRoYW5rcyBhIGxvdCBmb3IgeW91ciBj
b250cmlidXRpb24hCgpDb21taXR0ZWQgYm90aCB0byAyMDI0LjA1LngsIHRoYW5rcy4KCi0tIApC
eWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
