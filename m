Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A124CDB474
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 14:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29A5240A9F;
	Fri, 20 Oct 2023 14:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29A5240A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DsHc0scZbuN7; Fri, 20 Oct 2023 14:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F261B43341;
	Fri, 20 Oct 2023 14:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F261B43341
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88CDD1BF860
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 14:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F94D43341
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 14:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F94D43341
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y0A1jHb_fjUq for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 14:29:54 +0000 (UTC)
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEA7440A9F
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 14:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEA7440A9F
Received: from [192.168.242.214] (mail.ultratronik.de [82.100.224.114])
 by dd5108.kasserver.com (Postfix) with ESMTPSA id AC2535242670;
 Fri, 20 Oct 2023 16:29:49 +0200 (CEST)
Message-ID: <b2979a64-22b7-4006-9cec-912af8b1cb02@andin.de>
Date: Fri, 20 Oct 2023 16:29:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org,
 vfazio@xes-inc.com, "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
References: <20231017143424.430007-1-anaumann@ultratronik.de>
 <PH1P110MB1603AE1FC3925D2A2D33EEED9FD6A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <38dd6e9a-7fea-e3fb-21a1-5a381a36c8cf@mind.be>
 <bede2a82-ee1f-4f8a-97f8-c6e2b54b2b84@grenoble.cnrs.fr>
From: Andreas Naumann <dev@andin.de>
In-Reply-To: <bede2a82-ee1f-4f8a-97f8-c6e2b54b2b84@grenoble.cnrs.fr>
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=andin.de; 
 s=kas202309151109; t=1697812189;
 bh=BFocaghziu+lZ4LC0dgLccRpC07//Y7AT6hSfX1uZM8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=S9AfJocaMmjB0GGQnyU9/ILFRJPKeLbugFRBJI9nd4TReTxX5V/Y6nU7blL3ZR4qe
 xwWH0jrlI9K+EXBXwS35elqRWmlcyH6woOi34/jHqvDgB5XatwgZXV81L3D8urSObP
 +b1bUOmxY7AnT4jN2yiSd0O0fnHVRWuHBZ3/K4Gqdg4zpwZB1Pwm7VNJ7xmiew8pOb
 6VCQXHDDwzM9Zq6IJKLIK11JGh+1HZ+C6U1FlRIZiPmqs3qr1cKT/+ZxvL0DeR/+Nt
 mX6RCsgeVDmNSYPG5erXjHuOeOvHGqftXE3k+OmAISMOMbUeA7KAhM8UvfGLpHEjR/
 hHowk9avSHbgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=andin.de header.i=@andin.de
 header.a=rsa-sha256 header.s=kas202309151109 header.b=S9AfJoca
Subject: Re: [Buildroot] [External] - [PATCH 0/1] libgpiod v2
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVmluY2VudCwgYWxsLAoKT24gMTkuMTAuMjMgMDk6MzQsIEVkZ2FyIEJvbmV0IHdyb3RlOgo+
IEhlbGxvIQo+IAo+IE9uIDIwMjMtMTAtMTgsIGFib3V0IHdoZXRoZXIgdGhlIEFQSS1icmVha2lu
ZyBsaWJncGlvZCB2MiBzaG91bGQgYmUgYW4KPiB1cGdyYWRlIG9yIGEgbmV3IHBhY2thZ2UsIEFy
bm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+PiBJZiBpdCdzIGxpa2UgIm1vc3RseSBpdCB3aWxs
IHN0aWxsIHdvcmssIGJ1dCB0aGVyZSBhcmUgYSBmZXcgZnVuY3Rpb25zCj4+IHRoYXQgeW91IG5l
ZWQgdG8gcmVwbGFjZSB3aXRoIGEgbmV3IHZhcmlhbnQiLCB0aGVuIHRoZSBwcm9wZXIgYXBwcm9h
Y2gKPj4gaXMgaW5kZWVkIHRvIGZpeCB0aGUgcGFja2FnZXMgdGhhdCBmYWlsIHRvIGJ1aWxkLiBb
Li4uXQo+Pgo+PiBGb3IgYmlnZ2VyIEFQSSBjaGFuZ2VzIFsuLi5dIHdlIGluZGVlZCBuZWVkIGEg
bmV3IHBhY2thZ2UgbGliZ3Bpb2QyLgo+IAo+IEkndmUgd2F0Y2hlZCBhIHRhbGsgYnkgQmFydG9z
eiBHb2xhc3pld3NraSBhYm91dCB0aGUgbmV3IGxpYmdwaW9kLFsxXQo+IHRoZW4gc3RhcnRlZCBs
b29raW5nIGF0IHRoZSBkb2N1bWVudGF0aW9uIG9mIHRoaXMgbmV3IEFQSS5bMl0gTXkgZmVlbGlu
Zwo+IGlzIHRoYXQgdGhpcyBpcyBhIHF1aXRlIGV4dGVuc2l2ZSByZXdyaXRlLiBBIHByb2dyYW0g
d2FudGluZyB0byBzdXBwb3J0Cj4gYm90aCB0aGUgdjEgYW5kIHRoZSB2MiBBUElzIHdvdWxkIG5l
ZWQgcXVpdGUgYSBiaXQgb2YgY29uZGl0aW9uYWwKPiBjb21waWxhdGlvbi4KPiAKCkkndmUgZ290
IHRoZSBzYW1lIGltcHJlc3Npb24gYW5kIHdvdWxkIHZvdGUgdG8gY3JlYXRlIGxpYmdwaW9kMiBm
b3IgdGhlIApzYW1lIHJlYXNvbnMgQXJub3V0IHN0YXRlZC4gRXZlbiBpZiBjb25kaXRpb25hbCB1
c2UgaXMgcG9zc2libGUsIGl0J3MgCm5vdCB0aGF0IHN0cmFpZ2h0Zm9yd2FyZCBhbmQgcmVxdWly
aW5nIHNvbWVib2R5IHRvIGltcGxlbWVudCBhbmQgCnBvc3NpYmx5IHVwc3RyZWFtIHRob3NlIGZv
ciB0aGUgNCBkZXBlbmRlbnQgcGFja2FnZXMgc2VlbXMgbGlrZSBjcmVhdGluZyAKYSBiYXJyaWVy
LgoKSW4gYWRkaXRpb24sIGkgdGhpbmsgdGhlIGJlaGF2aW91ciBvZiB0aGUgdG9vbHMgaGFzIGNo
YW5nZWQgYSBiaXQsIGUuZy4gCmFmdGVyIGdwaW9zZXQgZmluaXNoZXMgaXQgcmV0dXJucyB0aGUg
R1BJTyB0byB0aGUgb3JpZ2luYWwgc3RhdGUgKGF0IApsZWFzdCB0aGF0J3Mgd2hhdCBJIHJlY2Fs
bCBmcm9tIHdoYXQgQsO2cmdlIHRvbGQgbWUgYWJvdXQgaXQpLgoKU28gaWYgcGVvcGxlIHVzZSBn
cGlvZ2V0L3NldCBhbmQgc28gb24gaW4gc2NyaXB0cywgdGhlIGJlaGF2aW91ciBtb3N0IApsaWtl
bHkgY2hhbmdlcyB1bmV4cGVjdGVkbHkuCgpAVmluY2VudCwgZG8geW91IGhhdmUgdGhlIGludGVu
dCBvciBtYXliZSBldmVuIGEgcGF0Y2ggZm9yIGNyZWF0aW5nIGEgCnNlcGFyYXRlIHYyIHBhY2th
Z2U/IE90aGVyd2lzZSBtZS9Cw7ZyZ2Ugd291bGQgbG9vayBpbnRvIGNvbWluZyB1cCB3aXRoIG9u
ZS4KCgpyZWdhcmRzLApBbmRyZWFzCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
