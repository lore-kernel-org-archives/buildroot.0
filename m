Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB53C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 20:54:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39AB06108E
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 20:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39AB06108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B02280C72;
	Wed, 18 Aug 2021 20:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wlRcJ3EjHhx5; Wed, 18 Aug 2021 20:54:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5717480C5E;
	Wed, 18 Aug 2021 20:54:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7CBC71BF344
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 20:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BEDC60BCF
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 20:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pM4AzFX4C2w3 for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 20:54:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-ws.aruba.it (smtpcmd01-ws.aruba.it [62.149.158.241])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CA6360B85
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 20:54:27 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.22.37])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GSZqm2oTAZx06GSZrmh2id; Wed, 18 Aug 2021 22:54:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629320065; bh=ebzidhlxzRTaiWwghb7+dnj/1NkgnNsIf+rmLmTQ5sQ=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=IxGmEA+Se8iRQHAwIWOMiiNMlg19IUeUD5Et1kttlXIe1QT8kXyxh1V2Zt7stHDUG
 iMZjjkeCQSP3FqANkzJV+XH5Gky2nHKgTaXz7Wy2cG8yVAqX0NLcyUihEYFzOy+B+T
 7OAR/DW3ZJeEGHlvqUy4nvJR5ij9TMEhVgXRhVAnWReDAk03JMbLgC2d71UnWhdOWU
 q0X/y/5eOwTxPavMrJkErwEso18OYqQwVCUnYB959L8CXZAhx8DwcI3Zl7/YK0wJfI
 xahMJNCsw0tWVx9HMv5jGfqAJvIyJfnynJ+2lq+5KGwsqYApLSoacvMPatLrOj7Mn3
 hqhapqYUZ0o0w==
To: Romain Naour <romain.naour@gmail.com>,
 Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20210726235656.1df4ddeb@windsurf>
 <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
 <20210726223435.2906458-2-giulio.benetti@benettiengineering.com>
 <b89f7acd-3549-f167-f984-b08a5a597a18@mind.be>
 <db8b4379-f0e6-88dd-cebd-f521e80dab1e@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <c1917984-eaaf-896b-ff50-b0a0eb14668e@benettiengineering.com>
Date: Wed, 18 Aug 2021 22:54:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <db8b4379-f0e6-88dd-cebd-f521e80dab1e@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfDiza3egorFX6DwKRdhv7CQAEXJEtACm9pgMl+KJIv+dwlj1/XibvdR6FiNzvsI37rH9/rLGGL7Uh2QEFzW6TEUCL01XXXS+C11Lmlhe0d9hPoeM892n
 HmW8fLdRVv7rc7MvMNfq92WK5e+9J0Nc6JFGXRNvDJFH1rGlcRQevJaznyPQk8ZBA25BNsTnEfmxvapW7EqCPjJdJGKd+DSzG3IunsICsHSJn8uOJwk0zQkz
 IxhDZI8Z6RnlFOCIt+2tyPt2vcCKHsCSCNZ20PSbeej0o8EX+1UcEpAnRMUQtojJqEwBBOU7UrUV5mo7o12t8Ew63quMtMlPNcSXq8tPqhjRy6WQ7m+cmg9p
 Q+xK3MGE2XbF3Iyzw7b6mVAqMZTL4+nESKEQA8iKppokrXKhPgyhDNdEr0BlfW1L3for2GKkQuJq04P3TQTdUIGAUMBCNA==
Subject: Re: [Buildroot] [PATCH v2 1/3] package/libgeos: fix build failure
 due to missing -mcmodel=large
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Nosthoff <buildroot@heine.tech>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgUm9tYWluLAoKT24gOC8xOC8yMSAxMDowMSBQTSwgUm9tYWluIE5hb3VyIHdyb3RlOgo+IEhl
bGxvIEFybm91dCwKPiAKPiBMZSAxNy8wOC8yMDIxIMOgIDIyOjM0LCBBcm5vdXQgVmFuZGVjYXBw
ZWxsZSBhIMOpY3JpdMKgOgo+Pgo+Pgo+PiBPbiAyNy8wNy8yMDIxIDAwOjM0LCBHaXVsaW8gQmVu
ZXR0aSB3cm90ZToKPj4+IFdoZW4gYnVpbGRpbmcgbGliZ2VvcyBmb3Igb3IxayAtbWNtb2RlbD1s
YXJnZSBpcyBuZWVkZWQgdG8gbGluaywgc28gbGV0J3MKPj4+IGFkZCB0aGF0IGdjYyBvcHRpb24g
aW4gY2FzZSB3ZSdyZSBidWlsZGluZyBmb3Igb3Ixay4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBH
aXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4+
IC0tLQo+Pj4gICBwYWNrYWdlL2xpYmdlb3MvbGliZ2Vvcy5tayB8IDQgKysrKwo+Pj4gICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGliZ2Vvcy9saWJnZW9zLm1rIGIvcGFja2FnZS9saWJnZW9zL2xpYmdlb3MubWsKPj4+IGluZGV4
IGEzNTU3MzJhZjguLjQzMjExZDA0MzQgMTAwNjQ0Cj4+PiAtLS0gYS9wYWNrYWdlL2xpYmdlb3Mv
bGliZ2Vvcy5tawo+Pj4gKysrIGIvcGFja2FnZS9saWJnZW9zL2xpYmdlb3MubWsKPj4+IEBAIC0y
Myw2ICsyMywxMCBAQCBpZmVxICgkKEJSMl9hcm0pJChCUjJfYXJtZWIpLHkpCj4+PiAgIExJQkdF
T1NfQ09ORl9PUFRTICs9IC1ERElTQUJMRV9HRU9TX0lOTElORT1PTgo+Pj4gICBlbmRpZgo+Pj4g
ICAKPj4+ICtpZmVxICgkKEJSMl9vcjFrKSx5KQo+Pj4gK0xJQkdFT1NfQ1hYRkxBR1MgKz0gLW1j
bW9kZWw9bGFyZ2UKPj4KPj4gICBBY2NvcmRpbmcgdG8gZ2l0LCAtbWNtb2RlbCB3YXMgYWRkZWQg
dG8gR0NDIGFmdGVyIHRoZSAxMS4yLjAgcmVsZWFzZS4gQXJlIHlvdQo+PiBzdXJlIHRoYXQgdGhp
cyB3b3Jrcz8KPj4KPj4gICBPb29oLCB3ZSBoYXZlIGEgcGF0Y2ggdGhhdCBhZGRzIGl0LiBCdXQg
dGhhdCBwYXRjaCBpcyBtaXNzaW5nIGZvciAxMS4xLjAgZm9yCj4+IHNvbWUgcmVhc29uLiBSb21h
aW4sIHlvdSBhcHBhcmVudGx5IGRpZG4ndCBjYXJyeSBhbnkgb2Ygb3VyIHBhdGNoZXMgd2hlbiB5
b3UKPj4gYWRkZWQgR0NDIDExIGluIDJhYjg4ZGFjMjkzYWVkNWFkZjI1MDRlOGIxODJmOWQ4YTMw
NmI5MzUuIFRoZSBjb21taXQgbWVzc2FnZQo+PiBkb2Vzbid0IHNheSBhbnl0aGluZy4gRG8geW91
IHJlbWVtYmVyIGFueXRoaW5nIGFib3V0IHRoZSBwYXRjaGVzPyBUaGUgcGF0Y2ggd2FzCj4+IGFk
ZGVkIHRvIG1hc3RlciBvbiBNYXkgMjEgYW5kIHlvdSBvbmx5IHN1Ym1pdHRlZCB0aGUgR0NDIGJ1
bXAgb24gSnVuZSAxMiwgYnV0Cj4+IHBlcmhhcHMgeW91IGFscmVhZHkgaGFkIGl0IGx5aW5nIGFy
b3VuZCBmb3IgYSB3aGlsZT8KPiAKPiBJbmRlZWQsIEkgbWlzc2VkIHRoaXMgcGF0Y2guCj4gCj4+
Cj4+ICAgR2l1bGlvLCBtYXliZSB5b3UgY2FuIHBvcnQgdGhlIHBhdGNoIHRvIDExLjEuMD8KPiAK
PiBZZXMgcGxlYXNlLgoKQWxyZWFkeSBzZW50IGFuZCBhcHBsaWVkIGhlcmUgOi0pOgpodHRwczov
L2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPTEzNzIyNWNlZjQyM2NjYmVi
YzMxZDBjNTYyYmYzZjM3MTkyNzM5YWMKCkknbSBnb2luZyB0byBhZGQgbXlzZWxmIHRvIHRvb2xj
aGFpbiBhcyBtYWludGFpbmVyIHRvbywgc28gSSBrZWVwIHVwIHRvIApkYXRlIG9uIHRvb2xjaGFp
biBtb3ZlbWVudCBhbmQgYWxzbyBJJ3ZlIGFkZGVkIGEgYnVuY2ggb2YgYmludXRpbHMvZ2NjCmJ1
Z3MuIFNvIGl0J3MgdGltZSBmb3IgaXQgOi0pCgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5l
dHRpCkJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPiAK
PiAKPj4KPj4gICBSZWdhcmRzLAo+PiAgIEFybm91dAo+Pgo+Pj4gK2VuZGlmCj4+PiArCj4+PiAg
IExJQkdFT1NfQ09ORl9PUFRTICs9IC1EQ01BS0VfQ1hYX0ZMQUdTPSIkKExJQkdFT1NfQ1hYRkxB
R1MpIgo+Pj4gICAKPj4+ICAgJChldmFsICQoY21ha2UtcGFja2FnZSkpCj4+Pgo+IAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldAo+IGh0dHA6Ly9saXN0cy5idXN5Ym94
Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
