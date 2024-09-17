Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018BDC35FF0
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 08:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0C9C40289;
	Tue, 17 Sep 2024 08:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyQun2am_iTb; Tue, 17 Sep 2024 08:08:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EFE940318
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EFE940318;
	Tue, 17 Sep 2024 08:08:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE7711BF276
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 08:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD3F9412E0
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 08:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1On6urOwOlL for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 08:08:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A3E840D33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A3E840D33
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A3E840D33
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 08:08:06 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id BE55835374D9; Tue, 17 Sep 2024 10:08:03 +0200 (CEST)
Date: Tue, 17 Sep 2024 10:08:03 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <Zuk44wSUMGbvMHXp@waldemar-brodkorb.de>
References: <ZubuMtvyrh/8Nj/W@waldemar-brodkorb.de>
 <a561aef2-5db9-4bc6-b3fb-4f2d61f0c9ea@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a561aef2-5db9-4bc6-b3fb-4f2d61f0c9ea@smile.fr>
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726560483; bh=Z+JK+gxzclCGY4wDJlfEeAnPeg0dkSYi/w6QyFKUrMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NPwB+4f39xqTTqGJ9sRV6kagYkGFZHBMaUQt4k9fMsNJk2Pnii3rtg5OFx4vbBsIe
 CPoRnQfAoc0ZveHUj4XWoQPWazGoJIxzD/Iq1EP9TvDvmldC8Me1o3VQBtbU2Ttmv/
 H4leI/a1Co2ZDNpc0QcajjDSbf6aXohl0qd4KE/RpmkAOe46LISfwyVZ4zWb4zxc/e
 NJUqG2xbzdw7VhR41UWtM6SxLCBeFk6i4KXC7Mra/dfJvOyHF04yOZBqtr4IAj3atW
 jGYmfJ764vTPpl+Va0ddkqXAwzF6qoqVKz/UAFDHFCIcMGifAXBi07DKbo55ta5kHG
 l/o7LQUiKQ6WA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=NPwB+4f3
Subject: Re: [Buildroot] [PATCH 2/2] package/qemu: update to 9.1.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLApSb21haW4gTmFvdXIgd3JvdGUsCgo+IEhlbGxvIFdhbGRlbWFyLAo+IAo+IExl
IDE1LzA5LzIwMjQgw6AgMTY6MjQsIFdhbGRlbWFyIEJyb2Rrb3JiIGEgw6ljcml0wqA6Cj4gPiBT
ZWUgaGVyZSBmb3IgY2hhbmdlczoKPiA+IGh0dHBzOi8vd2lraS5xZW11Lm9yZy9DaGFuZ2VMb2cv
OS4xCj4gPiAKPiA+IFRoZSBzdXBwb3J0IGZvciB0aGUgbmlvczIgYXJjaGl0ZWN0dXJlIGdvdCBy
ZW1vdmVkLgo+IAo+IEhvdyBkaWQgeW91IHRlc3QgdGhpcyB2ZXJzaW9uIGJ1bXA/CgpKdXN0IG1h
bnVhbGx5LgogCj4gSSB3b3VsZCByZWNvbW1lbmQgdG8gdXNlIGdpdGxhYi1jaSBhbmQgcHVzaCBh
IGJyYW5jaCB3aXRoIGEgc3BlY2lmaWMgbmFtZTogPHFlbXUKPiB2ZXJzaW9uPi1kZWZjb25maWdz
LXFlbXUgKHNlZSBbMV1bMl1bM10pLgo+IAo+IE5vdGU6IFdpdGggdGhlIGdpdGxhYi1jaSBmcmVl
IHRpZXIgKHVzaW5nIHNoYXJlZCBnaXRsYWItY2kgcnVubmVycyksIGRlZmNvbmZpZ3MKPiBsaWtl
IHRoZSBxZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcgdGFrZXMgdG9vIGxvbmcgdG8gYnVpbGQg
YW5kIHJlYWNoIHRoZSA2aAo+IGpvYiB0aW1lb3V0IG9yIGZpbGVzeXN0ZW0gc2l6ZSBsaW1pdC4K
ClJpZ2h0LCBpdCBzZWVtcyB0aGUgZmlsZXN5c3RlbSBsaW1pdCBpcyByZWFjaGVkIG9uIHRoZQpx
ZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcuCgpTZWUgaGVyZToKaHR0cHM6Ly9naXRsYWIuY29t
L3dieC1naXRodWIvYnVpbGRyb290Ly0vcGlwZWxpbmVzLzE0NTYxNzU5NDgKCk90aGVyd2lzZSBp
dCBsb29rcyBnb29kIGFmdGVyIGZpeGluZyB0aGUgcmlzY3YgcWVtdSBjb21tYW5kbGluZQpwcm9i
bGVtLgoKSSB3aWxsIHNlbnQgYSBuZXcgc2VyaWVzLgoKVGhhbmtzIGZvciBpbnRyb2R1Y2luZyB0
aGUgR2l0bGFiIHRlc3RpbmcgdG8gbWUuCgpiZXN0IHJlZ2FyZHMKIFdhbGRlbWFyCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
