Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E23CEBF8A
	for <buildroot@archiver.kernel.org>; Fri, 27 Sep 2024 09:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E92D424D4;
	Fri, 27 Sep 2024 09:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQ1WewKALYP2; Fri, 27 Sep 2024 09:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A00542488
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A00542488;
	Fri, 27 Sep 2024 09:45:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F13B1BF980
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 09:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A5DD42480
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 09:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujQx-3H5rB7d for <buildroot@lists.busybox.net>;
 Fri, 27 Sep 2024 09:45:43 +0000 (UTC)
X-Greylist: delayed 387 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 27 Sep 2024 09:45:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D44B442488
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D44B442488
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.204.228.163;
 helo=mail.bitwise.fi; envelope-from=anssi.hannula@bitwise.fi;
 receiver=<UNKNOWN> 
Received: from mail.bitwise.fi (mail.bitwise.fi [109.204.228.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D44B442488
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 09:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.bitwise.fi (Postfix) with ESMTP id EE68D460028;
 Fri, 27 Sep 2024 12:39:11 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at 
Received: from mail.bitwise.fi ([127.0.0.1])
 by localhost (mustetatti.dmz.bitwise.fi [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJYT1NRLxCC6; Fri, 27 Sep 2024 12:39:09 +0300 (EEST)
Received: from [192.168.5.205] (fw1.dmz.bitwise.fi [192.168.69.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: anssiha)
 by mail.bitwise.fi (Postfix) with ESMTPSA id 4EE6546000C;
 Fri, 27 Sep 2024 12:39:09 +0300 (EEST)
Message-ID: <ddca9f53-fc22-4bba-9c68-ed867b691a76@bitwise.fi>
Date: Fri, 27 Sep 2024 12:39:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
References: <20240911190900.982461-1-yann.morin.1998@free.fr>
 <871q1eidg8.fsf@dell.be.48ers.dk>
Content-Language: en-US
In-Reply-To: <871q1eidg8.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=bitwise.fi; s=mail; 
 t=1727429949; bh=FKBBmxXwpgp5RpLqYvDguZMmyt5Krlu0Y3q1qgr7WPI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=z04YCy698lM27uBsqZmzpKEVSuYMIE2h2tk2VxPO9vjHKvRpnt1uemBpkf9MzScqy
 sgmByst5mH9r2fuh/dHoCgTgLMgRKskviTqi2YZUjRt1hZl+1uK1h6H4Jx91PH0vE8
 MEruNrY9vL9kvc0fvZTumZ+7DN7tsrcxkdlw0bmM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=bitwise.fi
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=bitwise.fi header.i=@bitwise.fi header.a=rsa-sha256
 header.s=mail header.b=z04YCy69
X-Mailman-Original-Authentication-Results: mustetatti.dmz.bitwise.fi
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=bitwise.fi
Subject: Re: [Buildroot] [PATCH] support/scripts: fix RPATH fixups
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
From: Anssi Hannula via buildroot <buildroot@buildroot.org>
Reply-To: Anssi Hannula <anssi.hannula@bitwise.fi>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjAuOS4yMDI0IDE3LjUzLCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cj4+Pj4+PiAiWWFubiIg
PT0gWWFubiBFIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JpdGVzOgo+ICA+IENv
bW1pdCBhODdhYmNmNmRhNjUgKE1ha2VmaWxlOiBydW4gUFBEIGFuZCBSUEFUSCBmaXh1cCBpbiBo
b3N0LWZpYWxpemUpCj4gID4gKHNpYykgbW92ZWQgdGhlIGZpeHVwcyBwZXZpb3VzbHkgZG9uZSBp
biBwcmVwYXJlLXNkaywgdG8gaG9zdC1maW5hbGl6ZS4KPgo+ICA+IFRoaXMgZXhwb3NlZCBhIGJ1
ZyBpbiBmaXgtcnBhdGgsIHdoZW4gUlBBVEggY29udGFpbnMgbXVsdGlwbGUgZW50cmllcywKPiAg
PiBsaWtlOiAgL1BQRC9ob3N0LWZvby9ob3N0L2xpYjovUFBEL2hvc3QtZm9vL2hvc3QvbGliL2Zv
bwo+Cj4gID4gSW4gdGhhdCBzaXR1YXRpb24sIHdlIHdhbnQgdG8gZ2V0IHJpZCBvZiAvUFBEL2hv
c3QtZm9vIGFuZCByZXBsYWNlIGl0Cj4gID4gd2l0aCB0aGUgZmluYWxlIEhPU1RfRElSLCBzbyB3
ZSBtYW5nbGUgdGhlIFJQQVRIIHdpdGggYSBzZWQgZXhwcmVzc2lvbi4KPgo+ICA+IEhvd2V2ZXIs
IHRoYXQgc2VkIGV4cHJlc3Npb24gb25seSBldmVyIHJlcGxhY2VzIHRoZSBmaXJzdCBtYXRjaCwg
YXMgaXQKPiAgPiBpcyBtaXNzaW5nIHRoZSAnZycgb3B0aW9uLiBUaHVzLCB0aGUgc2Vjb25kIChh
bmQgZm9sbG93aW5nKSBwYXJ0cyBvZgo+ICA+IFJQQVRIIGFyZSBzdGlsbCByZWZlcnJpbmcgdG8g
dGhlIFBQRCwgYW5kIHRodXMgcGF0Y2hlbGYgZG9lcyBub3QgZmluZCBpdAo+ICA+IHJlbGF0aXZl
IHRvIHRoZSBmaW5hbCBIT1NUX0RJUiwgYW1kIHJvcHMgaXQuIFRoaXMgZXZlbnR1YWxseSBsZWFk
IHRvIGEKPiAgPiBmaW5hbCBSUEFUSCBzZXQgYXMgJE9SSUdJTi8uLi9saWIgaW5zdGVhZCBvZiB0
aGUgZXhwZWN0ZWQKPiAgPiAkT1JJR0lOLy4uL2xpYjokT1JJR0lOLy4uL2xpYi9mb28KPgo+ICA+
IFRoaXMgaXMgdGhlIGNhc2UgZm9yIGhvc3Qtc3lzdGVtZCwgd2hpY2ggaW5zdGFsbHMgc29tZSBv
ZiBpdHMgbGlicmFyaWVzCj4gID4gaW4gJFBSRUZJWC9saWIvc3lzdGVtZC8gYW5kIGFkZHMgYW4g
UlBBVEggc2V0IGFwcHJvcHJpYXRlbHkgdG8KPiAgPiAvUFBEL2hvc3Qtc3lzdGVtZC9ob3N0L2xp
YjovUFBEL2hvc3Qtc3lzdGVtZC9ob3N0L2xpYi9zeXN0ZW1kIGFuZCB0aGF0Cj4gID4gZ2V0cyBp
bmNvcnJlY3RseSBtYW5nbGVkLgo+Cj4gID4gRml4ZXM6IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2lzc3Vlcy8zOQo+Cj4gID4gQWxzbyBmaXggYSB0eXBvIGlu
IHRoZSBjb21tZW50IGp1c3QgYWJvdmUuCj4KPiAgPiBSZXBvcnRlZC1ieTogSm9zw6kgTHVpcyBT
YWx2YWRvciBSdWZvIEBqbHNhbHZhZG9yCj4gID4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJ
TiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4KPiBDb21taXR0ZWQsIHRoYW5rcy4KPgoKVGhl
IHRyaWdnZXJpbmcgY29tbWl0IHdhcyBiYWNrcG9ydGVkIHRvIDIwMjQuMDgueCBhbmQgMjAyNC4w
Mi54IHRvbyBzbwp0aGV5IGFyZSBhZmZlY3RlZCwgY2FuIHdlIGdldCB0aGlzIG9uZSB0aGVyZSBh
cyB3ZWxsPwoKVGhhbmtzLgoKLS0gCkFuc3NpIEhhbm51bGEgLyBCaXR3aXNlIE95CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
