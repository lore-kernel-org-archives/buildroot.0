Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9E3C47422
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 07:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDC1841E7E;
	Wed, 17 Jan 2024 07:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDC1841E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iYWP2GJv4tgw; Wed, 17 Jan 2024 07:27:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18AE741E32;
	Wed, 17 Jan 2024 07:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18AE741E32
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2425C1BF288
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 07:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09B6D6141D
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 07:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09B6D6141D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8MXujyeUMxEC for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 07:27:15 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAE3F61418
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 07:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAE3F61418
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D8AF40005;
 Wed, 17 Jan 2024 07:27:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rQ0KM-00Fk8n-28;
 Wed, 17 Jan 2024 08:27:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Jan =?utf-8?Q?Kundr=C3=A1t?= via buildroot <buildroot@buildroot.org>
References: <20240111105621.2321957-1-peter@korsgaard.com>
 <ee6bc481-faaf-4d84-a450-d9a2730f9fda@cesnet.cz>
Date: Wed, 17 Jan 2024 08:27:10 +0100
In-Reply-To: <ee6bc481-faaf-4d84-a450-d9a2730f9fda@cesnet.cz> ("Jan
 =?utf-8?Q?Kundr=C3=A1t?=
 via buildroot"'s message of "Tue, 16 Jan 2024 16:32:37 +0100")
Message-ID: <8734uwju7l.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/Makefile.in: set GIT_DIR=. in
 {HOST, TARGET}_MAKE_ENV
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
Cc: Jan =?utf-8?Q?Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkphbiIgPT0gSmFuIEt1bmRyw6F0IHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnPiB3cml0ZXM6CgogPj4gSW4gdGhlIGNvbnRleHQgb2YgQnVpbGRyb290IHRoZSBw
YWNrYWdlcyBhcmUgbmV2ZXIgYnVpbHQgaW4gdGhlaXIgb3duIGdpdAogPj4gY2hlY2tvdXQsIHNv
IHBhc3MgR0lUX0RJUj0uICB0byBlbnN1cmUgZ2l0IGRvZXNuJ3Qgd2FsayBiYWNrIHVwIHRoZQog
Pj4gZGlyZWN0b3J5IHRyZWUgYW5kIGZpbmRzIHRoZSBCdWlsZHJvb3QgZ2l0IHJlcG8sIHdoaWNo
IGZpeGVzIHRoZSByYXVjIChhbmQKID4+IHNpbWlsYXIpIGlzc3Vlcy4KCiA+IFRoaXMgaGFzIGNh
dXNlZCBhIHJlZ3Jlc3Npb24gZm9yIHVzLgoKU29ycnkgdG8gaGVhciB0aGF0LgoKID4gV2UncmUg
dXNpbmcgWnV1bCBDSSBbMV0gd2hpY2ggaXMgc2V0IHVwIHNvIHRoYXQgYW55IHBhdGNoIHRoYXQn
cwogPiB1cGxvYWRlZCBmb3IgcmV2aWV3IGluIGFueSBvZiBvdXIgaW50ZXJuYWwgcHJvamVjdHMg
YWxzbyB0cmlnZ2VycyBhCiA+IHRlc3QgYnVpbGQgdGhyb3VnaCBCdWlsZHJvb3QuIFNvbWUgb2Yg
dGhlc2UgYnVpbGRzIHdvdWxkIHVzZSBzZXF1ZW5jZXMKID4gb2YgeWV0LXVubWVyZ2VkIHBhdGNo
ZXMsIHNvIHRyYWNraW5nIHZlcnNpb24gaW5mbyBvZiBlYWNoIGNvbXBvbmVudCBpcwogPiBjcnVj
aWFsLCB3aGljaCBpcyB3aHkgd2UncmUgcHV0aW5nIGFsbCB0aGF0IGludG8gdGhlIHRhcmdldCdz
CiA+IC9ldGMvb3MtcmVsZWFzZSwgYXMgd2VsbCBhcyByZWxheWluZyBvbiB0aGUgYnVpbGQgc3lz
dGVtIHRvIGNhbGwgYW4KID4gZXF1aXZhbGVudCBvZiBhIGBnaXQgZGVzY3JpYmVgIGZvciBlYWNo
IG9mIG91ciBwcm9qZWN0cy4KCiA+IEZvciB0aGlzIGZlYXR1cmUsIHdlJ3JlIHJlbHlpbmcgb24g
YSBmZXcgaG9va3M6CgogPiAtIFp1dWwgaXRzZWxmIHByb2R1Y2VzIHRoZSBjb3JyZWN0IGNvbnRl
bnQgYXMgYSBnaXQgY2hlY2tvdXQgaW4gYQogPiAgIHNjcmF0Y2ggZGlyZWN0b3J5LAoKID4gLSBC
dWlsZHJvb3QgaXMgY29uZmlndXJlZCB2aWEgYGxvY2FsLm1rYCB0byB1c2UgdGhhdCBjaGVja291
dCBhcyBhCiA+ICAgc291cmNlIFsyXQoKID4gLSBhIGN1c3RvbSBob29rIHNldHMgdXAgdGhlIHJl
ZGlyZWN0aW9uIHZpYSB0aGUgYGdpdGRpcmAgc3RhdGVtZW50IGluCiA+ICAgdGhlIGJ1aWRscm9v
dCdzIGNvcHkgb2YgdGhlIHNvdXJjZSBkaXJlY3RvcnkgWzNdLCB0aGlzIHJlZGlyZWN0aW9uCiA+
ICAgaG93ZXZlciAgdGFrZXMgZWZmZWN0IGF0IHJ1bnRpbWUgKHNlZSBbNF0pCgpJIGRvbid0IHVu
ZGVyc3RhbmQgd2h5IHlvdSBkbyA+IFwkKEBEKS8uZ2l0LCBJIHdhcyB3b3VsZCBoYXZlCmV4cGVj
dGVkID4+IFwkKEBEKS8uZ2l0L2NvbmZpZyBidXQgT0suCgoKID4gLSB0aGUgYnVpbGQgc2NyaXB0
IG9mIGVhY2ggYXBwIHRoZW4gc2ltcGx5IHJ1bnMgYGdpdCBkZXNjcmliZWAgd2l0aCBhCiA+ICAg
ZmV3IGZsYWdzIGZvciBvdXRwdXQgZm9ybWF0dGluZzsgdGhlIGFwcHMgY3VycmVudGx5IGRvIG5v
dCBoYXZlIGEKID4gICB3YXkgb2YgYWNjZXB0aW5nIHNvbWUgZXh0ZXJuYWxseSBwcm92aWRlZCB2
ZXJzaW9uIHN0cmluZ3MuCgogPiBTb21lIG9mIG91ciBwcm9qZWN0cyB1c2UgZ2l0IHN1Ym1vZHVs
ZXMsIHdoaWNoIG1lYW5zIHRoYXQgbWFuaXB1bGF0aW5nCiA+IC5naXRkaXIgaGFzIHRvIGJlIGRv
bmUgY2FyZWZ1bHkuIFRoZSBUTDtEUiB2ZXJzaW9uIGlzIHRoYXQgdGhpcyBpcyBhCiA+IGJpdCBt
b3JlIGNvbXBsZXggdGhhbiBqdXN0IHB1dHRpbmcgYSB2ZXJzaW9uIG92ZXJyaWRlIGludG8gYSBm
aWxlLiBJbgogPiBzaG9ydCwgdGhlcmUncyBhbHJlYWR5IGEgZ2l0IGNoZWNrb3V0IHRoYXQncyBi
ZWVuIHByZXBhcmVkIHdpdGgKID4gYWNjdXJhdGUgdmVyc2lvbiBpbmZvLCBhbmQgaXQgbWFrZXMg
c2Vuc2UgdG8gdXNlIHRoYXQgaW5mbyBhcy1pcyAtLSBvcgogPiBpdCBoYXMgd29ya2VkIHdlbGwg
Zm9yIHVzIGluIHRoZSBwYXN0IHRocmVlIHllYXJzIDopLCB1cCB1bnRpbCB0aGlzCiA+IGNvbW1p
dC4KCkkgZ3Vlc3MgdGhvc2UgYXJlIGxvY2FsL2N1c3RvbSBwYWNrYWdlcyB0aGF0IHlvdSBoYXZl
IGluIHlvdXIgZXh0ZXJuYWwKdHJlZT8gQ2FuIHlvdSBwYXNzIEdJVF9ESVI9LmdpdCB0byB0aGVt
IChvciBtYWtlIHRoZW0gdW5zZXQgR0lUX0RJUikgdG8KbWFrZSB0aGVtIHVzZSB5b3VyIHByZXBh
cmVkIC5naXQgZGlyZWN0b3J5PwoKCiA+IEhvdyBhcmUgeW91IGd1eXMgc29sdmluZyB0aGlzIHBy
b2JsZW0gaW4geW91ciBDSSBzeXN0ZW1zPwoKVGhpcyBpcyBub3QgYXBwbGljYWJsZSB0byB0aGUg
Q0kgZG9uZSBmb3IgQnVpbGRyb290IGl0c2VsZiAod2hlcmUgd2UKd2FudCB0byBidWlsZCB0aGUg
dmVyc2lvbnMgc3BlY2lmaWVkIGluIHRoZSAubWsgZmlsZXMpLiBGb3IgJFdPUkssIEkKaGF2ZSBw
b3B1bGF0ZWQgYSBmaWxlIGluIGEgcG9zdC1idWlsZCBzY3JpcHQgbGlrZSB5b3VyIG9zLXJlbGVh
c2UgZmlsZS4KCgogPiBJcyB0aGVyZSBhIGNoYW5jZSBvZiB1bmRvaW5nIHRoaXMgZ2xvYmFsIEdJ
VF9ESVIgd2hpY2gsCiA+IHVuZm9ydHVuYXRlbHksIHRha2VzIHByZWNlZGVuY2Ugb3ZlciB0aGUg
cHJvamVjdHMnIG93biAuZ2l0ZGlyCiA+IG1lY2hhbmlzbT8KClRoZSBwcm9ibGVtIHRoaXMgY2hh
bmdlIHRyaWVkIHRvIGZpeCBpcyByZWFsLCBzbyB0aGUgcXVlc3Rpb24gaXMgaG93IHdlCmNhbiBj
b250aW51ZSB0byBmaXggdGhpcyBpc3N1ZSAod2l0aG91dCBoYXZpbmcgdG8gcGxheSB3aGFjay1h
LW1vbGUgZm9yCmVhY2ggcGFja2FnZSkgd2hpY2ggc3RpbGwgc3VwcG9ydGluZyBhIHVzZSBjYXNl
IGxpa2UgeW91cnMuCgpUaGFua3MgZm9yIHRoZSBoZWFkcyB1cCEKCi0tIApCeWUsIFBldGVyIEtv
cnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
