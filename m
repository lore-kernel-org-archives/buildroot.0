Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8A2C433FE
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 13:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29906842F0;
	Thu, 17 Mar 2022 13:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4SlVtYmPLHWK; Thu, 17 Mar 2022 13:35:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38DC984268;
	Thu, 17 Mar 2022 13:35:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73EAB1BF36B
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 13:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52FDF41715
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 13:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9zbPvzLNKbBG for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 13:35:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CBDF416DC
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 13:35:43 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id ay7so5573460oib.8
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 06:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mc8UwOJJmjEJ8q68ArDqiMeJF7WzJyJSPli3LVyxP0A=;
 b=lG9VXIJkeCYV9sE7h718vPsESTm9rXtUB+j9xaa/pUKaruCpeFHJKM1QUSIqKuODne
 1osNiBs6/Nq1Zmgj+DK/ij7qc19BkKzW4A/v4Nk+rwQArJqeYyzXUuPqkLfYAL75gSCq
 0wf+t46eL2eCiYr428sKAyAmoAd93lmdzMkCTjT7HV9sQppmIxry5d0hQgXU7YN1gHwN
 PHqqeEWfCve7HwqvjDFC1zOTGvyUDXEf2EDUdJk6Z0HmZCB5vGatkjWrITHtRznZ+NBd
 tAjO2YwIYya8mhXnFkf048bNt0WJbHDjC/UUj6XfhgkPZmRUXoGNJr0lEtrQU3Tpt/ZR
 ib4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mc8UwOJJmjEJ8q68ArDqiMeJF7WzJyJSPli3LVyxP0A=;
 b=0LB043+x9ovV+Az1AbmBgXiMB8s/ItICq9XsBAe4TRzTlComVMYQlm/F9RXGgsrEn+
 tWEpOWPFMcBVQMwn7BBOS3vkDCkumI4LLldGTJNHOYJTMbQce7LnZ6iPVU9yZZV0K6iS
 barwVN5IgWLJSJyh3kAMLIvbvqmRi9xS3ttY7p80LpJQ7B9GGgNy+9jYIvtN5yl7qDLF
 kVm7ClYpSU/mx6HRGH1zrCMyxLcyB/7elsKUlusJ5nkrx33AN88wCSypwN+6c3WXay+x
 rvjJtXYHBdrOzm2KPtkwTxT5aagH6RNdCkHt8H/POI+kTnbvfajvWoOX3hxHXSxmzwl9
 G0Tg==
X-Gm-Message-State: AOAM532Am9jkZToNa4v5bA8bNMX3kC3ox2LdoE4uTXva7o77FoocUjHL
 iS/l40eTAEkLmAn8SHbuJXNe1RDVVp2RrqBT31+1aLMQnW0=
X-Google-Smtp-Source: ABdhPJyfmU5rPKGtx9XyLNJq6Nwc8evOPWanmny2IXifmghY8OehU+ClYdfvU+HslmZaRFQhs4KgkD9dMiePRgkuiC8=
X-Received: by 2002:a05:6808:48c:b0:2ec:b263:c189 with SMTP id
 z12-20020a056808048c00b002ecb263c189mr2057247oid.148.1647524140866; Thu, 17
 Mar 2022 06:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <YQXPR01MB612157C72AF87C24A7890356AE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <YQXPR01MB612157C72AF87C24A7890356AE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 17 Mar 2022 14:35:29 +0100
Message-ID: <CAPi7W80XOk0C_MCEQB1KxyHyBGdLzGG-KNWfkj5UJDY+KnTKDw@mail.gmail.com>
To: "Sassen, Rutger" <rsassen@comecer.com>
Subject: Re: [Buildroot] package gdk-pixbuf relocatable issue
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgamV1LiAxNyBtYXJzIDIwMjIgw6AgMTQ6MTksIFNhc3NlbiwgUnV0Z2VyIDxyc2Fzc2VuQGNv
bWVjZXIuY29tPiBhIMOpY3JpdCA6Cj4KPiBIZWxsbyBGYWJyaWNlLAo+Cj4gPiA+IEEgcmVjZW50
IHBhdGNoIGZvciBwYWNrYWdlIGdkay1waXhidWYgdG8gZW5hYmxlIHRoZSByZWxvY2F0YWJsZSBv
cHRpb24gZm9yIHRoZSBob3N0IHBhY2thZ2UgaGFzIGludHJvZHVjZWQgYSBwcm9ibGVtIGZvciB0
aGUgdGFyZ2V0IHBhY2thZ2UuCj4gPgo+ID4gPiBUaGUgbG9hZGVycy5jYWNoZSBmb3IgdGhlIHRh
cmdldCBjdXJyZW50bHkgaXMgZ2VuZXJhdGVkIGJ5IGNvcHlpbmcgdGhlIGxvYWRlcnMuY2FjaGUg
ZnJvbSB0aGUgaG9zdCBwYWNrYWdlIGFuZCBlZGl0aW5nIGl0IHVzaW5nIGEgc2VkIGNvbW1hbmQg
dG8gcmVwbGFjZSB0aGUgaG9zdCBwYXRocyB3aXRoIHRhcmdldCBwYXRocy4gVGhlIHNlZCBjb21t
YW5kIGlzIG5vIGxvbmdlciBjb3JyZWN0LCBzaW5jZSB0aGUgaG9zdCBsb2FkZXJzLmNhY2hlIGRv
ZXMgbm90IGNvbnRhaW4gYWJzb2x1dGUgcGF0aHMgYW55bW9yZS4KPiA+ID4KPiA+ID4gVGhlIGNv
bnNlcXVlbmNlIGlzLCB0aGF0IHRoZSB0YXJnZXQgbG9hZGVycy5jYWNoZSBub3cgY29udGFpbnMg
ZW50cmllcyBsaWtlICJsaWIvZ2RrLXBpeGJ1Zi0yLjAvMi4xMC4wL2xvYWRlcnMvbGlicGl4YnVm
bG9hZGVyLSoiLiBUaGVzZSBwYXRocyBhcmUgaW5jb3JyZWN0LCBhbmQgYXBwbGljYXRpb25zIHVz
aW5nIGdkay1waXhidWYgd2lsbCBjcmFzaCBiZWNhdXNlIHRoZXkgYXJlIG5vIGxvbmdlciBhYmxl
IHRvIGxvYWQgaW1hZ2VzLiBCZWZvcmUgdGhlIHBhdGNoLCBpdCB3b3VsZCBjb250YWluIGFic29s
dXRlIHBhdGhzIGxpa2UgIi91c3IvbGliL2dkay1waXhidWYtPiAyLjAvMi4xMC4wL2xvYWRlcnMv
bGlicGl4YnVmbG9hZGVyLSoiLgo+ID4gPgo+ID4gPiBJJ20gbm90IHN1cmUgd2hhdCB0aGUgYmVz
dCBhcHByb2FjaCB3b3VsZCBiZSB0byBmaXggdGhpcyBpc3N1ZS4gRWl0aGVyIGJ5IG1vZGlmeWlu
ZyB0aGUgU0VEIHN0YXRlbWVudCwgb3IgYnkgbW9kaWZ5aW5nIHRoZSB3YXkgdGhlIHRhcmdldCBs
b2FkZXJzLmNhY2hlIGlzIGdlbmVyYXRlZCAoaS5lLiBieSBub3QgdXNpbmcgdGhlIGhvc3QgbG9h
ZGVycy5jYWNoZSBhcyBhIGJhc2UpLgo+ID4KPiA+IFRoYW5rcyBmb3Igc3BvdHRpbmcgdGhpcyBp
c3N1ZSwgSSB0aGluayB0aGUgYmVzdCBhcHByb2FjaCBpcyB0bzoKPiA+IC0gc2V0IHJlbG9jYXRh
YmxlIHRvIHRydWUgZm9yIHRoZSB0YXJnZXQgKHNlZQo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDIxOTEyMjUyNi4yOTU0MzU0LTEt
Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20pCj4gPiAtIGRyb3AgR0RLX1BJWEJVRl9VUERBVEVf
Q0FDSEUgKHdoaWNoIGhhcyBubyBlZmZlY3QgYW55bW9yZSkKPiA+Cj4gPiBDYW4geW91IGNvbmZp
cm0gdGhhdCB0aGlzIGFwcHJvYWNoIGlzIHdvcmtpbmc/Cj4KPiBVbmZvcnR1bmF0ZWx5IHRoaXMg
aXMgbm90IHdvcmtpbmcuIFdpdGhvdXQgdGhlIEdES19QSVhCVUZfVVBEQVRFX0NBQ0hFLCB0aGUg
dGFyZ2V0IGVuZHMgdXAgd2l0aCBubyBsb2FkZXJzLmNhY2hlIGF0IGFsbC4KSW5kZWVkLCBnb29k
IGNhdGNoLCB0aGVuIHdlIGNhbiBvbmx5IGRyb3AgdGhlIFNFRCBjb21tYW5kLgoKSG93ZXZlciwg
Y2FuIHlvdSBjb25maXJtIHRoYXQgc2V0dGluZyByZWxvY2F0YWJsZSB0byB0cnVlIGRvZXNuJ3Qg
Zml4IHRoZSBpc3N1ZT8KRnJvbSBteSB1bmRlcnN0YW5kaW5nLCBpZiByZWxvY2F0YWJsZSBpcyB0
cnVlLCBnZGstcGl4YnVmIHNob3VsZApwcmVwZW5kIHRoZSB0b3BsZXZlbCBkaXI6Cmh0dHBzOi8v
Z2l0bGFiLmdub21lLm9yZy9HTk9NRS9nZGstcGl4YnVmLy0vYmxvYi9tYXN0ZXIvZ2RrLXBpeGJ1
Zi9nZGstcGl4YnVmLWlvLmMjTDM1MgoKSWYgdGhpcyBkb2Vzbid0IHdvcmsgKGJlY2F1c2UgdGhl
IHRvcGxldmVsIGRpciBpcyBub3QgY29ycmVjdCksIHRoZW4KdGhlIGJldHRlciBvcHRpb24gd291
bGQgYmUgdG8gdXBkYXRlIHRoZSBTRUQgY29tbWFuZCB0byBwcmVwZW5kIC91c3IvCnRvIGFsbCBs
aWIgcGF0aHMuCj4gSXTigJlzIGFsc28gbm90IHBvc3NpYmxlIHRvIHJ1biBnZGstcGl4YnVmLXF1
ZXJ5LWxvYWRlcnMgaW4gdGhlIHRhcmdldCBkaXJlY3RvcnkgYmVjYXVzZSB0aGUgYXJjaGl0ZWN0
dXJlIG1pZ2h0IGRpZmZlciBmcm9tIHRoZSBob3N0Lgo+Cj4gQmVzdCByZWdhcmRzLAo+Cj4gUnV0
Z2VyCj4KPgo+IERpc2NsYWltZXIKPgo+IFRoaXMgZW1haWwgY29tbXVuaWNhdGlvbiBpcyBDT05G
SURFTlRJQUwuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHlvdSBtYXkg
bm90IHVzZSwgY29weSBvciBkaXNjbG9zZSB0byBhbnlvbmUgdGhlIG1lc3NhZ2Ugb3IgYW55IGlu
Zm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGUgbWVzc2FnZSBhbmQgSSBhc2sgdGhhdCB5b3UgcGxl
YXNlIG5vdGlmeSBtZSBieSByZXR1cm4gZW1haWwgYW5kIGRlbGV0ZSB0aGlzIGNvbW11bmljYXRp
b24gaW1tZWRpYXRlbHkuIFRoYW5rIHlvdS4KQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
