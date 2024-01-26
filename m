Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169CDC47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 16:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CADD41BDD;
	Fri, 26 Jan 2024 16:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CADD41BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90iIA_tNmHb0; Fri, 26 Jan 2024 16:02:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE76E41770;
	Fri, 26 Jan 2024 16:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE76E41770
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 151C61BF293
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E113F404B0
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E113F404B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5T6cpG3YYQmC for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 16:02:48 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B9DA401D2
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 16:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B9DA401D2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B1D9C0003;
 Fri, 26 Jan 2024 16:02:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rTOfF-00ACo3-0K;
 Fri, 26 Jan 2024 17:02:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <Jamie.Gibbons@microchip.com>
References: <20240126100903.2139253-1-peter@korsgaard.com>
 <7a66a52cc9a4b5bd68d89480a2ff8ac05239415e.camel@microchip.com>
Date: Fri, 26 Jan 2024 17:02:44 +0100
In-Reply-To: <7a66a52cc9a4b5bd68d89480a2ff8ac05239415e.camel@microchip.com>
 (Jamie Gibbons's message of "Fri, 26 Jan 2024 12:44:01 +0000")
Message-ID: <87plxo2icb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] board/microchip/mpfs_icicle/genimage.cfg:
 drop legacy gpt = true
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
Cc: Ludovic.Desroches@microchip.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gICA8SmFtaWUuR2liYm9uc0BtaWNyb2NoaXAuY29tPiB3cml0ZXM6CgogPiBPbiBGcmks
IDIwMjQtMDEtMjYgYXQgMTE6MDkgKzAxMDAsIFBldGVyIEtvcnNnYWFyZCB3cm90ZToKID4+IEVY
VEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxl
c3MgeW91IGtub3cKID4+IHRoZSBjb250ZW50IGlzIHNhZmUKID4+IAogPj4gR2VuaW1hZ2UgY29t
cGxhaW5zIGFib3V0IHRoZSBjb25maWcgdXNpbmcgdGhlIGRlcHJlY2F0ZWQgZ3B0IG9wdGlvbjoK
ID4+IAogPj4gSU5GTzogaGRpbWFnZShzZGNhcmQuaW1nKTogVGhlIG9wdGlvbiAnZ3B0JyBpcyBk
ZXByZWNhdGVkLsKgIFVzZQogPj4gJ3BhcnRpdGlvbi10YWJsZS10eXBlJyBpbnN0ZWFkCiA+PiAK
ID4+IFNvIGNoYW5nZSB0byBwYXJ0aXRpb24tdGFibGUtdHlwZSBmb3IgY29uc2lzdGVuY3kgd2l0
aCB0aGUgb3RoZXIKID4+IGNvbmZpZ3MuCgogPiBIaSBQZXRlciwKCiA+IFRoYW5rcyBmb3IgdGhl
IHVwZGF0ZS4KCiA+IEphbWllLgoKID4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8
cGV0ZXJAa29yc2dhYXJkLmNvbT4KID4gVGVzdGVkLWJ5OiBKYW1pZSBHaWJib25zIDxqYW1pZS5n
aWJib25zQG1pY3JvY2hpcC5jb20+CgpDb21taXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVy
IEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
