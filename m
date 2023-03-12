Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722DDC6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 21:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC0D5415E9;
	Sun, 12 Mar 2023 21:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC0D5415E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rxd634AZ5_yh; Sun, 12 Mar 2023 21:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E690F4156E;
	Sun, 12 Mar 2023 21:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E690F4156E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 171501BF2CF
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB3774156A
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB3774156A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rKWplPx2OIwN for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:43:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F5DC4156E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F5DC4156E
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:43:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1DFD940004;
 Sun, 12 Mar 2023 21:43:26 +0000 (UTC)
Date: Sun, 12 Mar 2023 22:43:26 +0100
To: Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>
Message-ID: <20230312224326.68a1f832@windsurf>
In-Reply-To: <20230223104048.333575-1-martin@geanix.com>
References: <20230223104048.333575-1-martin@geanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678657407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3u8hvap0/1+VZLjWtRAaCJGld39FHm/MZsp0goNBaw=;
 b=F0I0+ZiV7Wi/O0/732bjrwTEKt6DWXHjNqQPXHd7zw5oLsQusJ8A2tsQywT47hplzfY0LL
 Eb90Ihcsv1QQi0oRxGwnMCVU6yVZJfMO4LY30kPpSDrt9GSXOf1OXqaOo3cVJYO//53uCB
 /+mqN1h5CFbfK8cMCJgulV6A5oLbLInSlOV+B6zwhcGrIY2pF7nehZbq6BZYlKwjw18uUj
 p3AkJYFdvU9ZyICtLmoPFcvCbbxVZwryu4e3F98a7PI4WGq4+9hPqYSwim/cIl7ETNkbUI
 iS/9pW8YN8qA2Hn5UWluR3Sgu2ySLOl9iRRzPB7Lgtw83v4cgF6nes+HBTg+uw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F0I0+ZiV
Subject: Re: [Buildroot] [PATCH] ifupdown: bump to 0.8.41
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWFydGluLAoKVGhhbmtzIGZvciB0aGlzIGNvbnRyaWJ1dGlvbiEKCk9uIFRodSwgMjMg
RmViIDIwMjMgMTE6NDA6NDggKzAxMDAKTWFydGluIEh1bmRlYsO4bGwgPG1hcnRpbkBnZWFuaXgu
Y29tPiB3cm90ZToKCj4gRnJvbTogTWFydGluIEh1bmRlYm9sbCA8bWFydGluQGdlYW5peC5jb20+
Cj4gCj4gTXVzbCBpcyBub3Qgc3VwcG9ydGVkIHNpbmNlIEp1bmUgMjAxNywgd2hlcmUgdXNlIG9m
IGZubWF0Y2goKSB3YXMKPiBpbnRyb2R1Y2VkIHRvIHN1cHBvcnQgd2lsZGNhcmQgbWF0Y2hpbmcg
b24gaW50ZXJmYWNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gSHVuZGViw7hsbCA8bWFy
dGluQGdlYW5peC5jb20+CgpJIGZpbmQgaXQgYSBiaXQgYW5ub3lpbmcgdG8gZGlzYWJsZSBhIHBh
Y2thZ2UgYXMgc2ltcGxlL2NvcmUgYXMKaWZ1cGRvd24gd2l0aCBtdXNsLgoKQWxwaW5lIExpbnV4
IGhhcyB0d28gcGF0Y2hlcyBhdApodHRwczovL2dpdC5hbHBpbmVsaW51eC5vcmcvYXBvcnRzL3Ry
ZWUvbWFpbi9pZnVwZG93bj9oPW1hc3RlciB0aGF0CmFkZHJlc3MgdGhlIGJ1aWxkIGlzc3VlIGJ5
IGRpc2FibGluZyB0aGUgdXNlIG9mIEZOTV9FWFRNQVRDSCB3aXRoIG11c2wuClNpbmNlIHRoaXMg
b25seSBhZGRzIGFkZGl0aW9uYWwgd2lsZGNhcmQgbWF0Y2hpbmcgY2FwYWJpbGl0aWVzLCBpdAp3
b3JrcyBmaW5lIHdpdGhvdXQuCgpQZXJoYXBzIGlmdXBkb3duIHNob3VsZCBzaW1wbHkgYmUgaW1w
cm92ZWQgdG8gdXNlIEZOTV9FWFRNQVRDSCBpZgpzdXBwb3J0ZWQ/CgpJbiBhbnkgY2FzZSwgaWYg
d2Ugd2FudCB0byBpbmRlZWQgYWRkIHRoZSAhbXVzbCBkZXBlbmRlbmN5IGxpa2UgeW91cgpwYXRj
aCBkb2VzLCB0aGUgQ29uZmlnLmluIGNvbW1lbnQgbmVlZHMgdG8gYmUgYWRqdXN0ZWQgdG8gYWNj
b3VudCBmb3IKdGhlICFtdXNsIGRlcGVuZGVuY3kuCgpCZXN0IHJlZ2FyZHMsCgpUaG9tYXMKLS0g
ClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
