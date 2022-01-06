Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D654AC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 14:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6584E6FC01;
	Thu,  6 Jan 2022 14:21:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bf3lCL9iQ9oK; Thu,  6 Jan 2022 14:21:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B84D96FBE6;
	Thu,  6 Jan 2022 14:21:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C43F21BF406
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 14:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C04186FBE6
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 14:21:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vx_eZcy8SHZH for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 14:21:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1BED60E07
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 14:21:02 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id o7so3201949ioo.9
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 06:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a0bvdX0O1ax5mHZI6eGN3v0ZwxI6T50SjTqujbUEsvw=;
 b=Pe1HOTV0wBqnXfBX8fscaFs5CY7i7c2TdBw+80AJ0/4vsiHjuu3WEMH3wImUTaRA0N
 fWOzXFlzvK2R+ULbtAQQ2x/37UjR8wdRN+cAFF5JsbzB11rktcJ4bFoCmw5fkTW/BKL4
 iCMbslSKRqi852v8iduSNYKIdAho5tXZQ3x7fXNsKbQsLqQ+RHuaX6WUiVjZ1sdLUhLp
 SUTCbzAd6U7XdQIxWAAbKWPcBH6mcVs+Wm1aLjwNiHblp0AksIE/wiiqofsn3AzKhmzV
 YV/vZF74VBkja+LoYSyM18PzJGEDzbPlS78NsPfdP4/MkdJ89EVJZqRfFVIyRjNv2M4Y
 O8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a0bvdX0O1ax5mHZI6eGN3v0ZwxI6T50SjTqujbUEsvw=;
 b=MG2qGcrS4Hxkdsqjw3KKGgRw7fIDzqIF996YsC5d25120d5zfnG2O7i7CDzt0baGyP
 PJkaopFzddIN71FiadKeWS9ftM1Sxyz5BRvLsh+NNaswLEo6CKOiwx1JwuQyf6y1aOOj
 FbyenzOCd0jUO8GgQphAYre51WO3pNs2FIKfYEwrjIwhRgQX9DywZnHuECRcE4PTM8bj
 ksvpKTUcMp+DK5d5XnPF6fiNm42MIXRv7fG4wg8pKjFscozaLogwkvGpx9RoLhEYjYvu
 rVmTFeqQRk/C/lrX6ms9zuVzzmI4sNAe55Qs598xAaU8ntxIO/tLPdGsudnBYxIQlIYb
 sMuQ==
X-Gm-Message-State: AOAM532mWxuHSXPBxtJBU+EP6Z45301gF2RgE5XGMb0SCal1DBMGMPP6
 9dJ8x/IYWmyDJwYKYL2LP+cBjm3ICgZm2Lb2AH5441o6
X-Google-Smtp-Source: ABdhPJz5FHFwkQaD4algYdMCL0F7IwWjXkPioP34J9G0KWwPF7TkrCXERfz+K42CgtA8QalNRMYQsrukQ+YKNsRYz/8=
X-Received: by 2002:a6b:2b12:: with SMTP id r18mr27274217ior.66.1641478861527; 
 Thu, 06 Jan 2022 06:21:01 -0800 (PST)
MIME-Version: 1.0
References: <CANxTyt77U8pvGxbjHi5MRL5Y3OgafCs_rWNSb=aAY=2BJ0X7ZA@mail.gmail.com>
 <cfeacd99-c264-d440-5145-009440450287@mind.be>
In-Reply-To: <cfeacd99-c264-d440-5145-009440450287@mind.be>
From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 6 Jan 2022 09:20:50 -0500
Message-ID: <CANxTyt5nhTZpB4VadypNDom3g4bdGPKj4cHnXumRT7eAUxS-Tg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] call with hooks
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SHUgQXJub3V0LAoKVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24uICBJIGZlZWwgYmV0dGVyIG5v
dyA6KQoKRGFub21pIC0KCgpPbiBUaHUsIEphbiA2LCAyMDIyIGF0IDQ6MzkgQU0gQXJub3V0IFZh
bmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3cm90ZToKPgo+Cj4KPiBPbiAwNS8wMS8yMDIy
IDE3OjIwLCBEYW5vbWkgTWFuY2hlZ28gd3JvdGU6Cj4gPiAgIEhlbGxvIGFsbCwKPiA+Cj4gPiBJ
IG5vdGljZWQgYSBwb3NzaWJsZSBpbmNvbnNpc3RlbmN5LCBhbmQgdGhvdWdodCBJIHNob3VsZCBw
b3N0IGl0Lgo+ID4gTG9va2luZyBhdCBwbGFjZXMgd2hlcmUgYnVpbGRyb290IHVzZXMgaG9va3M6
Cj4gPgo+ID4gJCBncmVwIC1yICckKGhvb2spKSQoc2VwKScgLgo+Cj4gW3NuaXBdCj4gPgo+ID4g
Tm90aWNlIHRoYXQgdGhlIG9uZSBoaXQgaW4gTWFrZWZpbGUgdXNlcyAiJCgkKGhvb2spKSQoc2Vw
KSIgd2hpbGUgdGhlCj4gPiBoaXRzIGluIHBrZy1nZW5lcmljLm1rIHVzZSAiJChjYWxsICQoaG9v
aykpJChzZXApIi4gIE15IE1ha2UtZnUgaXNuJ3QKPiA+IHBvd2VyZnVsIGVub3VnaCB0byB1bmRl
cnN0YW5kIGlmIHRoZXJlIGlzIGFuIGFjdHVhbCBwcm9ibGVtIC0gc2hvdWxkCj4gPiB0aGVyZSBi
ZSBhICJjYWxsIiBpbiB0aGUgTWFrZWZpbGUgbGluZT8gIFRoZSBnZW5lcmFsIHN5bnRheCBmb3Ig
Y2FsbAo+ID4gaXMgIiQoY2FsbCB2YXJpYWJsZSxwYXJhbSxwYXJhbSzigKYpIiBzbyBJIGRvbid0
IGZvbGxvdyB3aGF0IHRoZSBleHRyYQo+ID4gY2FsbCBpbiAkKGNhbGwgJChob29rKSBpcyBkb2lu
ZyBmb3IgdXMuCj4KPiAgIEhpc3RvcmljYWwgYWNjaWRlbnQuCj4KPiAgIFRoZSBwZXJzb24gd2hv
IGZpcnN0IGludHJvZHVjZWQgdGhlIGhvb2tzIGJhY2sgaW4gdGhlIGRheXMgZGlkbid0IHJlYWxp
emUgdGhhdAo+ICQoY2FsbCAuLi4pIGlzIG5vdCBmb3IgInNvbWV0aGluZyB0aGF0IGxvb2tzIGxp
a2UgYSBmdW5jdGlvbiIsIGJ1dCByYXRoZXIgaXQgaXMKPiBmb3IgIndoZW5ldmVyIHlvdSB3YW50
IHRvIHBhc3MgYXJndW1lbnRzIi4gUmV2aWV3ZXJzIGFsc28gZGlkbid0IHJlYWxpemUgdGhpcwo+
IGFuZCBqdXN0IGFwcGxpZWQsIGFuZCB3aGVuIG1vcmUgaG9va3Mgd2VyZSBhZGRlZCBsYXRlciB0
aGV5IGNvcGllZCB0aGUgcGF0dGVybi4KPgo+ICAgUmVnYXJkcywKPiAgIEFybm91dAo+Cj4gPgo+
ID4gVGhhbmtzLAo+ID4gRGFub21pIC0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
