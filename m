Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0168CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 16:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EE48405ED;
	Mon,  2 Sep 2024 16:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5ctQiFoB8Ey; Mon,  2 Sep 2024 16:09:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6E3B40291
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6E3B40291;
	Mon,  2 Sep 2024 16:09:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8AD1BF38E
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 383FB400B8
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgk4kkqpy81Q for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 16:09:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 368DC40291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 368DC40291
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 368DC40291
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 16:09:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32AC7FEC;
 Mon,  2 Sep 2024 09:09:26 -0700 (PDT)
Received: from debian (unknown [10.57.15.108])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BEE23F73B;
 Mon,  2 Sep 2024 09:08:59 -0700 (PDT)
Date: Mon, 2 Sep 2024 18:08:55 +0200
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZtXjFyjZbhF8q014@debian>
Mail-Followup-To: Peter Korsgaard <peter@korsgaard.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
References: <20240722093710.1903540-1-vincent.stehle@arm.com>
 <87o75a152u.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o75a152u.fsf@dell.be.48ers.dk>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: Re: [Buildroot] [PATCH] configs/qemu_arm_ebbr: linux needs
 host-openssl
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBBdWcgMzAsIDIwMjQgYXQgMDQ6MDI6NDlQTSArMDIwMCwgUGV0ZXIgS29yc2dhYXJk
IHdyb3RlOgo+ID4+Pj4+ICJWaW5jZW50IiA9PSBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3Rl
aGxlQGFybS5jb20+IHdyaXRlczoKPiAKPiAgPiBUaGUga2VybmVsIGJ1aWxkIG5lZWRzIGhvc3Qt
b3BlbnNzbDsgYWRkIGl0IHRvIHRoZSBjb25maWd1cmF0aW9uLgo+ICA+IEluIHByYWN0aWNlIHRo
ZSBkb2N1bWVudGVkIGJ1aWxkIHJlY2lwZSB3b3JrcyBmaW5lIGFuZCB0aGUgYnVpbGQgZmFpbHVy
ZXMKPiAgPiBjYW4gb25seSBiZSBzZWVuIHdpdGggaGlnaGx5IHBhcmFsbGVsIGJ1aWxkcyB1c2lu
ZyBwZXItcGFja2FnZSBkaXJlY3Rvcmllcy4KPiAKPiAgPiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dp
bmcgY29tcGlsYXRpb24gZXJyb3I6Cj4gCj4gID4gICBjZXJ0cy9leHRyYWN0LWNlcnQuYzoyMTox
MDogZmF0YWwgZXJyb3I6IG9wZW5zc2wvYmlvLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkK
PiAKPiAgPiBGaXhlczogNzExNWFiMzkxODlhNmM2NjA3NDUyNjdkOGJmMGJmNDFjZjhiM2RiNwo+
IAo+IEFyZSB5b3Ugc3VyZT8gSXNuJ3QgaXQgZnJvbSB0aGUgYnVtcCB0byA2LjYuMzIgaW4gY29t
bWl0IGQwMzdkOWMyZDYzZTljCj4gKGNvbmZpZ3MvcWVtdTogVXBkYXRlIGRlZmNvbmZpZ3MgdG8g
TGludXggNi42LjMyKT8KCkhpIFBldGVyLAoKWWVzOyBJIGRpZCBzb21lIG1vcmUgdGVzdHMgdG8g
Y29uZmlybSBhbmQgSSBhbSBwcmV0dHkgc3VyZSBub3c6CgogICAgICAgIENvbW1pdCAgUmVzdWx0
ICBDb21tZW50cwogIC0tLS0tLS0tLS0tLSAgLS0tLS0tICAtLS0tLS0tLQogIDcxMTVhYjM5MTg5
YSAgQnJva2VuICAoSSBuZWVkZWQgdG8gY29uZmlndXJlIHdpdGggZ2NjIDEyIHRvIGJ1aWxkLikK
ICA0NGE2Yjc4NjZjOTUgIEJyb2tlbgogIGQwMzdkOWMyZDYzZSAgQnJva2VuCgpXaXRoIEJSMl9M
SU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkgYWRkZWQsIGFsbCB0aHJlZSBjb21taXRz
IGJ1aWxkIGZpbmUuCgpJIHRlc3RlZCB3aXRoOgoKICAkIG1ha2UgcWVtdV9hcm1fZWJicl9kZWZj
b25maWcKICAkIG1ha2UgbGludXgKCi4uLm9uIGEgaG9zdCB3aXRoIG5vIG9wZW5zc2wgKEkgdXNl
IGEgY2hyb290IGZvciB0aGF0IHB1cnBvc2UpLgoKQmVzdCByZWdhcmRzLApWaW5jZW50LgoKPiAK
PiAtLSAKPiBCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
