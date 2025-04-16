Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E842C369C4
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 19:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0995380EDB;
	Wed, 16 Apr 2025 19:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLHHWbY4qNFi; Wed, 16 Apr 2025 19:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4953280E5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4953280E5B;
	Wed, 16 Apr 2025 19:20:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F5B3920
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E5EA40F72
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0A791FfySvl for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 19:20:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AFBD840AB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFBD840AB1
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFBD840AB1
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:20:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 103AF1C1032; Wed, 16 Apr 2025 21:19:59 +0200 (CEST)
Message-ID: <065809af-e4b6-4bd8-9f53-49d39fab38af@rnout.be>
Date: Wed, 16 Apr 2025 21:19:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>
References: <20250415195547.199428-1-thomas.perale@mind.be>
 <87tt6o3oxx.fsf@dell.be.48ers.dk>
Content-Language: en-GB
In-Reply-To: <87tt6o3oxx.fsf@dell.be.48ers.dk>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744831199; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Oif/Tl51lGcsa8lQCE0CORaCodqzCprhAQg54h5r2Gg=;
 b=LfeT1jTutx6B8pfvfXdAaCVXjlEyNSgLxaGrMeVx71yBflwAqOT7rs4lweMkveyPjnyHbl
 M3+2DEHZbbtf7qcVi+Caeewpt6+F30d65ZOpyPhlL1ZXPwIQwls1B8Y8Y51cgR+vyZ+Yb1
 gvl0zZT+neMBgwc0j9TFK6IVurm4lj2wnnNMLn9ZkLSOH0aZEG+zwiSBobwDSNSXrRhNpl
 ILo9X6+f+OHS99evsx66By7nidFYgfL5CQcYCqYZP4J5vPAPeZcTgttHYu6Wh8nDZygcqM
 4WsaImQ63wQya/idXAv8T0dls0pC79yfEAg5//wXp5hHioaPfLG+h1egRdw/GA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 0/7] Add PURL support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDE2LzA0LzIwMjUgMjE6MDcsIFBldGVyIEtvcnNnYWFyZCB3cm90ZToKPj4+Pj4+ICJUaG9t
YXMiID09IFRob21hcyBQZXJhbGUgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5v
cmc+IHdyaXRlczoKPiAgID4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkIHN1cHBvcnQgZm9yIHRoZSBQ
VVJMLgo+ICAgPiBodHRwczovL2dpdGh1Yi5jb20vcGFja2FnZS11cmwvcHVybC1zcGVjCj4KPiBO
aWNlIQo+Cj4gICA+IFBVUkwgYXJlIGEgc29mdHdhcmUgaWRlbnRpZmllciBzaW1pbGFyIHRvIENQ
RS4KPiAgID4gTW9yZSBpbmZvcm1hdGlvbiBvbiBQVVJMIGNhbiBiZSBmb3VuZCBpbiB0aGUgZmly
c3QgcGF0Y2ggb2YgdGhlIHNlcmllcy4KPgo+ICAgPiBBZnRlciB0ZXN0aW5nIHRoZSB1c2FnZSBv
ZiBQVVJMIHdpdGggRGVwZW5kZW5jeVRyYWNrIGFuZAo+ICAgPiBodHRwczovL29zc2luZGV4LnNv
bmF0eXBlLm9yZyBJIGNhbiBzZWUgdGhhdCBpdCBpbXByb3ZlcyB0aGUgdHJhY2tpbmcKPiAgID4g
b2YgQ1ZFcyBhbmQgdmVyc2lvbiBidW1wCj4KPiBPdXQgb2YgaW50ZXJlc3QsIGhvdyBkb2VzIGl0
IGhlbHAgKGRvIHlvdSBoYXZlIGFuIGV4YW1wbGU/KQo+Cj4gRG9lcyBhIFBVUkwgbWF0Y2ggY29t
cGxpY2F0ZSBhbnl0aGluZyBpZiB3ZSBhZGQgYSBsb2NhbCAoc2VjdXJpdHkpIHBhdGNoCj4gdG8g
YSBwYWNrYWdlPwoKIMKgQXMgbG9uZyBhcyB0aGUgdG9vbCByZXBvcnRzIENWRXMsIHRoZSBDVkUg
ZXhjbHVzaW9ucyBzdGlsbCB3b3JrLiAoV2VsbCwgSSAKZG9uJ3QgYWN0dWFsbHkga25vdyBmb3Ig
c3VyZSBpZiB0aGUgQ1ZFIGV4Y2x1c2lvbnMgcmVhbGx5IHdvcmsgaW4gCkRlcGVuZGVuY3lUcmFj
ayB3aXRoIG91ciBDeWNsb25lRFgsIElJVUMgaXQncyBjb21wbGljYXRlZCA6LSkuCgogwqBPZiBj
b3Vyc2UsIGlmIHRoZSB0b29sIHJlcG9ydHMgR0hTQSdzLCB0aGVyZSdzIG5vdGhpbmcgd2UgY2Fu
IGRvIHdpdGggdGhhdC4uLgoKCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
