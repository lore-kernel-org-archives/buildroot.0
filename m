Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9C9C4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 17:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63EB580C39;
	Sat, 31 Dec 2022 17:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63EB580C39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t2VbpX6-JE0i; Sat, 31 Dec 2022 17:58:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BACBD80BAF;
	Sat, 31 Dec 2022 17:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BACBD80BAF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F6B31BF33F
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 17:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5736440148
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 17:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5736440148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qb6a_A8DipfT for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 17:58:40 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF3A640131
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF3A640131
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 17:58:39 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Bg18pY53bydI8Bg19pcnVd; Sat, 31 Dec 2022 18:51:35 +0100
Message-ID: <40df416d-7db3-4053-28ea-a98316551069@benettiengineering.com>
Date: Sat, 31 Dec 2022 18:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <CB65BA13-5218-4C00-86E0-CB128E71F322@benettiengineering.com>
 <BCF6BFBB-EE5A-43FA-B64A-E2513A4A3BCF@benettiengineering.com>
 <20221231142342.1189ede4@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221231142342.1189ede4@windsurf>
X-CMAE-Envelope: MS4xfP0yjhGLtczzC11DLsXepUWZRDDre0cSXwM85x67qriZm3Uu1cAJ2tpX3rB43inWZ3gMtKjKkuWdv/a0Zh39VT43xO0a2RObuwLJw42Hs22wvZ2WicoE
 C3Wu5R0YMR6Eqf8UB3+1/QoML8UOiBRgEGylcNTi/G3Wbox6Nt4T0LcHXpx3oynQ6ubFBkGE91L9woCNDh811x455wYvmzlINuOom9bWjZieTTBJyUTND41d
 +xUW59KplJXQPGhkhpdO+/rFmBdGITb7a8guFmu9idsnqUdzSnxvnN314AZ1FgID
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672509095; bh=BZ2ULRqP/u+1lcsca6bjPb5l8cXzAURVpQTiMlhr60A=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=mycJfOX+haSWzoBvV9ZmkweR8GQWEpQeJURr/UTCEEHzJOEnqc8b0bGvXu9xL6KnK
 DBbPLmO375AbSWYglP141OGP/YUw0tVShgxCWYybw7EcypbV3+vyrSDnOZxhUpUpbW
 NIQQVHf6ANsksAIyGZ5hwfjJBgxbM994RKz7FY35dChLpLJhvn1mflF3yxm+h/bWaK
 5RyPUKwp0T3xEblVbyM1ZneIEmKN4oqKDuJd6B16I6hHgrw7vAtAZHJnQ300NIVADr
 DghBdPfdS5VZA7FiXJVQVLbOhYylpUeB4ReQGX9RwarbKjmlKCZYzxzP5L/qAfsnHy
 56ZD+s7DOmKbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=mycJfOX+
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure up
 to Linux 6.1
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
Cc: Kris Bahnsen <kris@embeddedts.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gMzEvMTIvMjIgMTQ6MjMsIFRob21hcyBQZXRhenpvbmkgdmlhIGJ1
aWxkcm9vdCB3cm90ZToKPiBPbiBUaHUsIDI5IERlYyAyMDIyIDIzOjA2OjU1ICswMTAwCj4gR2l1
bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3Rl
Ogo+IAo+Pj4gSG93IGNhbiBJIHBvaW50IG15IGZpeGVzPyBEbyB5b3UgdGhpbmsgaXTigJlzIGVu
b3VnaCB0byBvcGVuIGFuIElzc3VlIGluIGxpbnV4LWF0OTEgR2l0SHViPwo+Pgo+PiBUaGV5IGRv
buKAmXQgaGF2ZSB0aGUgSXNzdWUgYXZhaWxhYmxlIGluIEdpdEh1YiwgSSBzZW5kIGFuIGVtYWls
IHRvIHRoZSBtYWludGFpbmVyIHRoZW4uCj4gCj4gT3BlbiBhIHB1bGwgcmVxdWVzdC4KCkRvIHlv
dSBtZWFuIG9uY2UgdGhleSBjcmVhdGUgYSBicmFuY2ggZm9yIDYuMT8KT3IgZXZlbiBhZ2FpbnN0
IDUuMTUsIDUuMTAgZXRjLiBpZiB0aGVyZSBhcmUgY2hhbmdlcyB0aGF0IHJlZ2FyZCB0aG9zZQp2
ZXJzaW9ucz8KClNvcnJ5IGJ1dCBpdCdzIG5vdCBjbGVhciB0byBtZSB3aGF0IHlvdSBtZWFuLgoK
QmVzdCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpDRU8vQ1RPQEJlbmV0dGkgRW5naW5lZXJp
bmcgc2FzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
