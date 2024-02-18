Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E74C48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 22:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D29E660610;
	Sun, 18 Feb 2024 22:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o32snJ5mabq7; Sun, 18 Feb 2024 22:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF99F60797
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF99F60797;
	Sun, 18 Feb 2024 22:28:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AEE61BF4D6
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 22:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26184403EA
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 22:28:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eroow1V5LA7y for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 22:28:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.87;
 helo=smtpcmd0987.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D95204010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D95204010F
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D95204010F
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 22:28:37 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPA
 id bpeErLegR6ow9bpeErsAdR; Sun, 18 Feb 2024 23:28:35 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 18 Feb 2024 23:28:34 +0100
Message-Id: <43992C45-375D-4FF4-9EE4-F7FD15BB8DE1@benettiengineering.com>
References: <20240218230524.639348e6@windsurf>
In-Reply-To: <20240218230524.639348e6@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (21D61)
X-CMAE-Envelope: MS4xfPyi34dAzPc+FxLnufyB4dGnuNCC6UJSagxsspX8OaxQLwfxHjZBHDo0I531EKmmbYaf8qTNsM6tIEQB7IXWNWPktkPctK0z0JPEsgIyOD1YXjk8mTsK
 S1BgstbWlzvcVY/F1lcMMfs7MDh4rwgQn31JRq9y1oKHyztLlhgvz0IoAl8r29J7/7lPVe8a9I3Of6QqxIWexnPA7bolJz8bBR2gJz/NeY8LNb3bQB7hGf1Z
 aQ0HUmZC0pCDMOzjr0Cbc+yqJ/eEcMiAoY4sUCkNe5mB2WtXBGYj2kdpDAZn36MtzmosRq4VjDlg+tiorsTg25g1UlsnEXTzYVgiVETXNgG9o1xtJHzQFQ5T
 hF/hjSe/HcIcXAD0byOycrCKn1c1TsgvxqvHLYaZP2x+GQr77DtWlVH0F9NIK3OalP3fsp9QCnFM5/KZRxHQByvzv2O79IEE7+mkaE9Sd2ILoq7c+y11GdRP
 +LtKbiHYkfcVrO/H48hDkOcnEpqNrBBV7yCuox0BdUDtW0KZy+PGZYXO+1MKGTiKwvrazJ/Z1DDO21yU3BobBeoadHL0JLQqAu8uzow+Zr2biKHrsaVdVsoT
 +qs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708295315; bh=Kc9KN8iBMKYQRAKHmmmx1HQ+K1a2NPio2XvISDzrf0M=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=RahdagB2AR0APgOCKwnB0CJfK6NfAQlmwQx5uajftqmqBCLz81xDa6jbFZSOB2ydz
 D5zjXWo5p6EIdzA7k0n5sJrEUBforH+26wD5DMqwNeDn2DdXjZasnCqniSMr6KE296
 UL0TEpf5UMFcOaKc+7Q7G6wtZCMH3cPd8cYU68I02R/XENvV5QodPPSE+0U0qHtWCD
 DN2CIIb0uBaF4dR3F6rvqYXs01DF5XBUIFyjmqFheNymSINxQUu0YTAKAswTjlC/Oa
 W7DjTNzM3daZhXGxbB7Cs8iLI6GB0w2WRi42TR2MU3rF5zOpYJTgVulR5U1Z2xlZxQ
 l++Di+PV8hvRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=RahdagB2
Subject: Re: [Buildroot] [PATCH 0/8] Patch and remove Nios2 binutils bug
 27597
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Vincent Fazio <vfazio@gmail.com>, Pierre Ducroquet <pinaraf@pinaraf.info>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Yann MORIN <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLCBZYW5uLCBWaW5jZW50LCBBbGwsCgo+IElsIGdpb3JubyAxOCBmZWIgMjAyNCwg
YWxsZSBvcmUgMjM6MDUsIFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxp
bi5jb20+IGhhIHNjcml0dG86Cj4gCj4g77u/SGVsbG8sCj4gCj4+IE9uIFN1biwgMTggRmViIDIw
MjQgMTk6NDU6MjggKzAxMDAKPj4gR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0
dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+PiAKPj4gVGhpcyBwYXRjaHNldCBhZGQgYmFja3Bv
cnRlZCBwYXRjaGVzIGZvciBCdWlsZHJvb3QgTmlvczIgYmludXRpbHMgYnVnIDI3NTk3IGFuZAo+
PiBkcm9wIHBhY2thZ2VzIGRlcGVuZGVuY3kgb24gaXQuIERvaW5nIHRoaXMgdGhlIGV4dGVybmFs
IHRvb2xjaGFpbiB3aWxsIGZhaWwKPj4gYnVpbGRpbmcgdGhvc2UgcGFja2FnZXMsIHNvIEknbSBu
b3QgdGhhdCBzdXJlIGhvdyB0byBkZWFsIHdpdGggdGhpcyBzaXR1YXRpb24uCj4+IFRoZSBzYW1l
IGhhcHBlbmVkIGZvciBPcGVuUmlzYyBhbmQgYXMgZmFyIGFzIEkgcmVtZW1iZXIgdGhlIGZpcnN0
IHBhdGNoIG9mIHRoZQo+PiBzZXJpZXMgaGFzIGJlZW4gYXBwbGllZCwgdGhlbiBCb290bGluIHRv
b2xjaGFpbnMgaGF2ZSBiZWVuIHBhdGNoZWQgYW5kIHJlYnVpbHQvCj4+IHJlZGVwbG95ZWQsIGlu
IHRoZSBlbmQgdGhlIHJlbWFpbmluZyBwYXRjaGVzIGhhdmUgYmVlbiBhcHBsaWVkLiBCdXQgaGVy
ZSB3ZSBhbHNvCj4+IGhhdmUgU291cmNlcnkgQ29kZUJlbmNoIE5pb3MtSUkgMjAxOC4wNSB0b29s
Y2hhaW4gdGhhdCBjb250YWluIHRoZSBidWcsIHNvIEkKPj4gZG9uJ3Qga25vdyBob3cgdG8gZGVh
bCB3aXRoIHRoaXMgc2l0dWF0aW9uIHRvIGF2b2lkIGJ1aWxkIGZhaWx1cmVzLgo+IAo+IEZpcnN0
IG9mIGFsbCwgdGhhbmtzIGZvciBmb2xsb3dpbmcgdXAgb24gdGhpcywgSSdtIHJlYWxseSBoYXBw
eSB0byBzZWUKPiB0aGF0IHdlIGFyZSBub3QgYWx3YXlzICphZGRpbmcqIG1vcmUgR0NDL2JpbnV0
aWxzIGJ1ZyBvcHRpb25zLCBidXQKPiBzb21ldGltZXMgKnJlbW92aW5nKiBzb21lIG9mIHRoZW0u
CgpJdCB3b3VsZCBiZSBncmVhdCBpZiBzb21lIE1pY3JvYmxhemUgb3IgU2g0IGJ1ZyBjb3VsZCBi
ZSBwYXRjaGVkIHRvby4KVGhlcmXigJlzIGEgcGF0Y2ggcHJvcG9zZWQgYnkgVmluY2VudCBmb3Ig
YSBNaWNyb2JsYXplIGdjYyBJQ0UuClZpbmNlbnQsIGl0IHdvdWxkIGJlIGdyZWF0IGlmIHlvdSBw
cm92aWRlIGEgcGF0Y2hzZXQgc2ltaWxhciB0byB0aGlzIGZvciBnY2MsIG9yIEkgY2FuIGRlYWwg
d2l0aCBpdC4KCj4gCj4gUmVnYXJkaW5nIHRoZSBDb2RlQmVuY2ggTklPU0lJIHRvb2xjaGFpbiBm
cm9tIDIwMTguMDUsIEkgdGhpbmsgd2UgY291bGQKPiBzaW1wbHkgZGVsZXRlIGl0LiBJdCBtYWtl
cyBzZW5zZSB0byBzdXBwb3J0IG9sZCB0b29sY2hhaW5zIHRvIHNvbWUKPiBleHRlbnQsIGJ1dCBO
SU9TSUkgaXMgYSB2ZXJ5IGNvbmZpZGVudGlhbCBhcmNoaXRlY3R1cmUsIGFuZCBhbG1vc3QgNgo+
IHllYXJzIG9sZCB0b29sY2hhaW4gaXMgcmVhbGx5IGFuY2llbnQuIFNvIEkgd291bGQgYmUgZW50
aXJlbHkgZmluZSB3aXRoCj4gZHJvcHBpbmcgdGhpcyB0b29sY2hhaW4uCgpJdCBzb3VuZHMgZ29v
ZCB0byBtZSBhbmQgaXTigJlzIHNpbWlsYXQgc3VnZ2VzdGlvbiBvZiBZYW5uLgoKT25lIHRoaW5n
IGlzIGxlZnQgb3V0IHRvIGRlYWwgd2l0aCwgQm9vdGxpbiB0b29sY2hhaW5zIHRoYXQgbmVlZCB0
byBiZSBwYXRjaGVkL3JlYnVpbHQvcmVkZXBsb3llZC4KClNvIEkgY2FuIGdpdmUgYSByZXNwaW4g
dG8gdGhpcyBzZXJpZXMgYWRkaW5nIGFub3RoZXIgcGF0Y2ggZHJvcHBpbmcgU291cmNlcnkgZXh0
ZXJuYWwgdG9vbGNoYWluIGFuZCB5b3UgY2FuIGFwcGx5IGl0IG9ubHkgYWZ0ZXIgdXBkYXRpbmcg
Qm9vdGxpbiBOaW9zMiB0b29sY2hhaW4odGhpcyBzaG91bGQgYmUgc3VmZmljaWVudCBzaW5jZSB0
aGUgYnVnIHNob3dzIHVwIG9ubHkgb24gTmlvczIpLgpUaGF0IHdheSBCdWlsZHJvb3Qgd2lsbCBi
ZSBidWcgMjc1OTcgZnJlZS4KClRoYW5rcyBmb3IgY29tbWVudGluZyEKCkJlc3QgcmVnYXJkcwpH
aXVsaW8KCj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6
em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
