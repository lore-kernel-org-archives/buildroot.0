Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC4EC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 12:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0915E818E8;
	Sun, 19 Mar 2023 12:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0915E818E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UREXBceh-6zg; Sun, 19 Mar 2023 12:04:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31444814A9;
	Sun, 19 Mar 2023 12:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31444814A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D119E1BF5A2
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 12:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B157340994
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 12:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B157340994
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TblWvZ891XIV for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 12:04:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B88CD40951
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B88CD40951
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 12:04:24 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.96.213])
 by Aruba Outgoing Smtp  with ESMTPSA
 id drltpsONmdwECdrlups6VN; Sun, 19 Mar 2023 13:04:22 +0100
Message-ID: <30459231-2d17-cfcb-18bf-b59fa58ca1ce@benettiengineering.com>
Date: Sun, 19 Mar 2023 13:04:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Indrek Kruusa <indrek.kruusa@gmail.com>
References: <CA+fTLhhanWy3Q3mj96yTD+4Hjxaeu=Eh5en_mhpwEbZ+deBPWA@mail.gmail.com>
 <4B628CF1-65C6-4661-BAFB-B969A770A66E@benettiengineering.com>
 <CA+fTLhgBT=oKNk6+RPqwck9iSG9gVs5_VgeLVa3Mbe7FW_mPjw@mail.gmail.com>
 <CA+fTLhgNJOodcZcADuKroNvD_-UQZdu2+=PcEvBSVKfyZwaFZg@mail.gmail.com>
Content-Language: en-US, it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CA+fTLhgNJOodcZcADuKroNvD_-UQZdu2+=PcEvBSVKfyZwaFZg@mail.gmail.com>
X-CMAE-Envelope: MS4xfCZun2i+aqpF4QZItdWqvmFyTktbG88712toGwvG75kfoNifYKbKO/e0GAF1KZZYciUWHsRZ4na0/8Fn1CqNfzOUpJNYOaycGQVbxpMYWeLOOPsUwo0a
 z/U4tdlIHK/HPQyvZAYZVSn3WiXCKzduZqnHWGgZoYiUOjverng+AyOQAv6cb2FwwTvUUbcFS/kBnR5cVFKFFLhUzUTXGPxkgb8UmninzSgYTuQ1B61IB7T9
 bglmTvdwBfJU2wXTjy1Q9rD7z0cSAaLqFXLLy1T4f6U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1679227462; bh=7LO0JSsuJ2uT6CknDfTHQxlW/BlsdUvJectgAHRb9MQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=UgXDVH+TcxcvSFCYkLiajE/Oi+pty6NxeF0wrykGFUtMq8QPFi5bK6cCcqQvH1cIn
 ioKqEyUw4+CeO4YMpcdTfDIXBxDrWlvME+6OO+V+Lz9bGm5iZoRonEeTOBjSvvll5W
 r3mU2fv5FelcdjHa3XGJFJXgFNc84NHuhgXQWMxkA986ZZcxtP2ntitaCbcvoXSvvu
 dO2OnroK0T9yQqGbJdclHGS3FV1D9QG9rORfRvc5HRZdYOoYcfIIwGH7qawlg0Kuhu
 pdWv7/4B1QTI/OgWVOCLaXqK5uvn5GoW3N4/pJVPcq2Bbwltsh+hBMF6NPHGALmmhQ
 pLyXaEZHckeUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UgXDVH+T
Subject: Re: [Buildroot] package/rtl8189fs: bug in conf, and a question
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSW5kcmVrLAoKT24gMTkvMDMvMjMgMTE6MDcsIEluZHJlayBLcnV1c2Egd3JvdGU6Cj4gCj4g
Cj4gS29udGFrdCBJbmRyZWsgS3J1dXNhICg8aW5kcmVrLmtydXVzYUBnbWFpbC5jb20gCj4gPG1h
aWx0bzppbmRyZWsua3J1dXNhQGdtYWlsLmNvbT4+KSBraXJqdXRhcyBrdXVww6RldmFsIFAsIDE5
LiBtw6RydHMgMjAyMyAKPiBrZWxsIDA5OjQzOgo+IAo+ICAgICBLb250YWt0IEdpdWxpbyBCZW5l
dHRpICg8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbQo+ICAgICA8bWFpbHRv
OmdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Pikga2lyanV0YXMga3V1cMOk
ZXZhbAo+ICAgICBQLCAxOS4gbcOkcnRzIDIwMjMga2VsbCAwMTowMToKPiAKPiAgICAgICAgIEhp
IEluZGtyZWssCj4gCj4+ICAgICAgICAgSWwgZ2lvcm5vIDE4IG1hciAyMDIzLCBhbGxlIG9yZSAy
Mjo0NiwgSW5kcmVrIEtydXVzYQo+PiAgICAgICAgIDxpbmRyZWsua3J1dXNhQGdtYWlsLmNvbSA8
bWFpbHRvOmluZHJlay5rcnV1c2FAZ21haWwuY29tPj4gaGEKPj4gICAgICAgICBzY3JpdHRvOgo+
Pgo+PiAgICAgICAgIO+7vwo+PiAgICAgICAgIEhpIQo+PiAgICAgICAgIEknbSB0cnlpbmcgdG8g
cHJlcGFyZSBhIHBhdGNoIGZvciBNYW5nb1BpIE1RIChBbGx3aW5uZXIgRDFzCj4+ICAgICAgICAg
UklTQy1WKS4gSSdtIGFsbW9zdCB0aGVyZSAtIFNhbXVlbCBIb2xsYW5kwqBtYW5hZ2VkIHRvIG1h
aW5saW5lCj4+ICAgICAgICAgaW5pdGlhbCBzdXBwb3J0IGZvciB0aGlzIGJvYXJkLCBzbyB2YW5p
bGxhIGxpbnV4Cj4+ICAgICAgICAga2VybmVswqA2LjMtcmMyIGJvb3RzIGZpbmUgKHdpdGggcHJv
cGVyL21vZGlmaWVkIHUtYm9vdCB2ZXJzaW9uKS4KPj4gICAgICAgICBUaGUgV2lGaSBtb2R1bGUg
aXMgYmFzZWQgb24gcnRsODE4OWZ0diBjaGlwIChTRElPIGNvbm5lY3Rpb24pCj4+ICAgICAgICAg
YW5kIGl0cyBkcml2ZXIgc2VlbXMgdG8gYmUgcHJvYmxlbWF0aWMuCj4+ICAgICAgICAgRmlyc3Qs
IGJ1aWxkcm9vdCdzIHBhY2thZ2UvcnRsODE4OWZzIGlzIGN1cnJlbnRseSBicm9rZW47IGl0Cj4+
ICAgICAgICAgcG9pbnRzIHRvIHRoZSB3cm9uZyBjb21taXQgKHNlZW1zIHRvIGJlIGNvcHkgcGFz
dGUgZXJyb3IsCj4+ICAgICAgICAgaW5oZXJpdGVkIGZyb20gcGFja2FnZS9ydGw4MTg5ZXMpLiBU
aGUgcmVzdWx0IGlzIHVudXNhYmxlLgo+IAo+ICAgICAgICAgYXMgVGhvbWFzIGFscmVhZHkgcG9p
bnRlZCB0aGUgY29tbWl0IHdvcmtzIG9rIGZvciBtZSB0b28uCj4gCj4+ICAgICAgICAgSSB1cGRh
dGVkIGl0IHRvIHRoZSBjb3JyZWN0IGNvbW1pdCAob24gdGhlIGNvcnJlY3QgYnJhbmNoKSBhbmQK
Pj4gICAgICAgICB0aGUgZHJpdmVyIGJ1aWxkcyBmaW5lIGFuZCBsb2FkcyBmaW5lLgo+IAo+ICAg
ICAgICAgV2hpY2ggYnJhbmNoIGFuZCBjb21taXQgaGF2ZSB5b3UgdXNlZD8gVGFrZSBjYXJlIHRo
YXQgdGhlIGNvbW1pdAo+ICAgICAgICAgYWN0dWFsbHkgdXNlZCBoYXMgbm90IHRoZSBzdXBwb3J0
IGZvciBMaW51eCA2LjMgdGhhdCBoYXMgYmVlbgo+ICAgICAgICAgYWRkZWQgbGF0ZXIuCj4gCj4+
ICAgICAgICAgVGhlcmUgYXJlIGNvdXBsZSBvZiBpc3N1ZXMgdGhvdWdoOgo+PiAgICAgICAgIC0g
Zm9yIHNvbWUgcmVhc29uIHRoZSBkZWJ1ZyBtb2RlIGluIGRyaXZlciBpcyBzZXQKPj4gICAgICAg
ICAtwqAgZHJpdmVyIHNlZW1zIHRvIGNvbnN0YW50bHnCoHJlc3RhcnQgdGhlIG1vZHVsZSwgYW5k
IGl0IGVtaXRzCj4+ICAgICAgICAgZW5kbGVzcyBkZWJ1ZyBtZXNzYWdlcwo+IAo+ICAgICAgICAg
VGhpcyBjb3VsZCBiZSBib3VuZCB0byB0aGUgYnJhbmNoL2NvbW1pdCBvZiB0aGUgZHJpdmVyLCBp
ZiBpdAo+ICAgICAgICAgaW5jbHVkZXMgTGludXggNi4zIHN1cHBvcnQgb3Igbm90Lgo+ICAgICAg
ICAgQnV0IGl0IHNob3VsZCwgb3RoZXJ3aXNlIGl0IHNob3VsZCBub3QgYnVpbGQuCj4gICAgICAg
ICBBbnl3YXkgSSBkb27igJl0IGtub3cgdGhhdCBtdWNoIGFib3V0IG90aGVyIGJyYW5jaGVzLgo+
ICAgICAgICAgTWF5YmUgeW91IG1lYW4gdGhhdCBtYXN0ZXIgYnJhbmNoIGlzIGZvciBydGw4MTg5
ZXMgYW5kIHJ0bDgxODlmcwo+ICAgICAgICAgYnJhbmNoIGlzIGZvciBydGw4MTg5ZnM/Cj4gCj4g
ICAgICAgICBBbHNvLCBob3cgZG8geW91IGRldGVybWluZSB0aGF0IHJ0bDgxODlmdHYgaXMgY29t
cGF0aWJsZSB3aXRoCj4gICAgICAgICBydGw4MTg5ZnM/Cj4gCj4+Cj4+ICAgICAgICAgU28sIGlz
IHRoZXJlIGFueWJvZHkgZm9yIHdob20gdGhlIHJ0bDgxODlmcyBsaW51eCBkcml2ZXIgd29ya3MK
Pj4gICAgICAgICBmaW5lIHdpdGgga2VybmVsIDYuMy1yY1g/Cj4+Cj4+ICAgICAgICAgUFMuIEkg
Y2FuwqBwcmVwYXJlIGEgcGF0Y2jCoHRvIGZpeCB0aGUgcGFja2FnZS9ydGw4MTg5ZnMgYnV0IEkK
Pj4gICAgICAgICBleHBlY3QgR2l1bGlvIHRvIGJ1bXAgdGhlIHZlcnNpb24gYWdhaW4gZm9yIGJv
dGgKPj4gICAgICAgICBwYWNrYWdlL3J0bDgxODllcyBhbmQgcGFja2FnZS9ydGw4MTg5ZnMgc29v
bi4KPiAKPiAgICAgICAgIFN1cmUgSSBjYW4gZG8gdGhhdCwgdGhlcmUgaXMgYWxyZWFkeSBhIHBl
bmRpbmcgcGF0Y2ggZm9yCj4gICAgICAgICBydGw4MTg5ZXMgYnV0IGl04oCZcyBhbHJlYWR5IHN1
cGVyc2VkZWQgYXQgdGhpcyBwb2ludC4KPiAgICAgICAgIEJ5IE1vbmRheSBJ4oCZbGwgc2VuZCB0
aGUgMiBwYXRjaGVzIG9yIGZlZWwgZnJlZSB0byBkbyBpdCBpbnN0ZWFkLgo+IAo+IAo+IAo+ICAg
ICBIaSEKPiAKPiAgICAgWWVzLCBmb3IgdGhlIHJ0bDgxODlmcyBrZXJuZWwgbW9kdWxlIHRoZSBj
b2RlIG11c3QgYmUgY2hlY2tlZCBvdXQKPiAgICAgZnJvbSB0aGUgcnRsODE4OWZzIGJyYW5jaC4g
Q3VycmVudGx5IHRoZSBjb21taXQgaGFzaCBmb3IgdGhlCj4gICAgIHBhY2thZ2UvcnRsODE4OWVz
IGFuZCBwYWNrYWdlL3J0bDgxODlmcyBpcyB0aGUgc2FtZSBhbmQgaXQncyBmcm9tCj4gICAgIHJ0
bDgxODlFU19saW51eC9tYXN0ZXIuIEl0IGJ1aWxkcyBidXQgaXQgcHJvZHVjZXMgdGhlIHdyb25n
IHRoaW5nIGluCj4gICAgIHRoZSBjYXNlIG9mIHRoZSBydGw4MTg5ZnMuIEknbSBmaW5lIGlmIGl0
IGdldHMgZml4ZWQgbmV4dCB3ZWVrIDspCgpGaW5lIEkndmUgY2hlY2tlZCBkZWVwZXIgdG9kYXkg
YW5kIGZvdW5kIHRoZSBzYW1lIGFzIHlvdSd2ZSBmb3VuZC4KCj4gICAgIEFib3V0IHJ0bDgxODlm
dHYgYW5kIGNvbXBhdGliaWxpdHkuIFRoZSBkaWZmZXJlbmNlIGJldHdlZW4KPiAgICAgcnRsODE4
OGZ0diBhbmQgcnRsODE4OWZ0diBjaGlwIHNlZW1zIHRvIGJlIHRoZSBjb25uZWN0aW9uIGludGVy
ZmFjZQo+ICAgICB0eXBlICh1c2IgYW5kIHNkaW8gYWNjb3JkaW5nbHkpLiBJdCBsb29rcyB0byBt
ZSB0aGF0IHRoZSBydGw4MTg5ZnMKPiAgICAgZHJpdmVyIHN0aWxsIHJlbGllcyBvbiB0aGUgODE4
OGYgc3BlY2lmaWMgY29kZSBidXQgaXQgYWRkcyBzZGlvCj4gICAgIGNhcGFiaWxpdHkgKHJvdWdo
bHkgc3BlYWtpbmcpLiBBbHNvLAo+ICAgICBodHRwczovL2xpbnV4LXN1bnhpLm9yZy9XaWZpI1JU
TDgxODlGVFYKPiAgICAgPGh0dHBzOi8vbGludXgtc3VueGkub3JnL1dpZmkjUlRMODE4OUZUVj4g
c2F5cyB0aGF0IHRoZSBydGw4MTg5ZnMKPiAgICAgYnJhbmNoIGlzIHRoZSBvbmx5IHdvcmtpbmcg
c29sdXRpb24gY3VycmVudGx5IChvciBoYXMgYmVlbiBhdCBsZWFzdCkuCgpPawoKPiAgICAgVGhl
cmUgY2FuIGJlIHNldmVyYWwgcmVhc29ucyB3aHkgaXQgZG9lc24ndCB3b3JrIGZvciBtZS4gVGhh
dCdzIHdoeQo+ICAgICBJIHdhcyBhc2tpbmcgZmlyc3QgYWJvdXQgdGhlIG90aGVycycgZXhwZXJp
ZW5jZSBvbiBhY3R1YWwgaGFyZHdhcmUsCj4gICAgIG1heWJlIHdpdGggdGhlIGRpZmZlcmVudCAo
bWF0dXJlKSBTT0MvcGxhdGZvcm0uCj4gCj4gCj4gT2gsIGFwcGFyZW50bHkgdGhlIE1hbmdvUGkg
TVEgcmVxdWlyZXMgdGhlIGV4dGVybmFsIHdpZmkgYW50ZW5uYSAod2hpY2ggCj4gaXMgYnVuZGxl
ZCB3aXRoIHRoZSBib2FyZCkgdG8gYmUgY29ubmVjdGVkIDspIFdpZmkgd29ya3Mgbm93IGZvciBt
ZSB0b28gCj4gKHdpdGggdGhlIGZpeGVkIHJ0bDgxODlmcyBjb21taXQpLiBJdCBzZWVtcyB0aGF0
IHByZXZpb3VzbHkgaXQgZ290IG5vIAo+IHNpZ25hbCBhbmQgd2FzIHJhcGlkbHkganVtcGluZyBp
biBhbmQgb3V0IGZyb20gcG93ZXIgc2F2aW5nLgoKUGVyZmVjdCwgc28gSSdtIGNyZWF0aW5nIHRo
ZSAyIHBhdGNoZXMsIDEgZm9yIHJ0bDgxODlldSBrZWVwaW5nIG1hc3RlcgpicmFuY2ggYnV0IGJ1
bXBpbmcgdG8gbGFzdCBjb21taXQgYW5kIDEgZm9yIHJ0bDgxODlmcyB0aGF0IGJ1bXBzIHRvCmxh
dGVzdCBjb21taXQgYnV0IG9mIHJ0bDgxODlmcyBicmFuY2guCgpUaGFuayB5b3UgZm9yIHBvaW50
aW5nIHJ0bDgxODlmcyBicmFuY2ggYW5kIHRlc3RpbmchCgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxp
byBCZW5ldHRpCkJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCgo+IAo+IEluZHJlawo+IAo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
