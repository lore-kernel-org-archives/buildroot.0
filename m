Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D460C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 11:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAFFE4056D;
	Sun, 28 Apr 2024 11:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EoTiNaSJd0yf; Sun, 28 Apr 2024 11:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53A8440603
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53A8440603;
	Sun, 28 Apr 2024 11:08:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 049D01BF5DF
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 11:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2D9881465
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 11:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibX31ROcC--I for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 11:07:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CEF8A80C13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEF8A80C13
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEF8A80C13
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 11:07:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B432C0004;
 Sun, 28 Apr 2024 11:07:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s12Nq-003Hrt-0D;
 Sun, 28 Apr 2024 13:07:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240324162848.17338-1-flavio.tapajos@newtesc.com.br>
 <9da7a354-13d5-4294-af8e-b6155688bdcc@mind.be>
Date: Sun, 28 Apr 2024 13:07:50 +0200
In-Reply-To: <9da7a354-13d5-4294-af8e-b6155688bdcc@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Wed, 27 Mar 2024 22:16:51
 +0100")
Message-ID: <87jzkheoe1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/python-sqlalchemy: add cython
 for python-sqlalchemy
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
Cc: =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFybm91dCIgPT0gQXJub3V0IFZhbmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdCA8YnVp
bGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyaXRlczoKCiA+IE9uIDI0LzAzLzIwMjQgMTc6MjgsIEZs
w6F2aW8gVGFwYWrDs3Mgd3JvdGU6CiA+PiBGcm9tOiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGls
bGlhcmQxQGdtYWlsLmNvbT4KID4+IFdoZW4gbWlncmF0aW5nIHRvIHNldHVwdG9vbHMgd2l0aCBw
ZXA1MTcgc3VwcG9ydCB3ZSBuZWVkIHRvIGFkZAogPj4gaG9zdC1weXRob24tY3l0aG9uIHdoaWNo
IGlzIGEgcGVwNTE3IGJ1aWxkIGRlcGVuZGVuY3kgZm9yCiA+PiBweXRob24tc3FsYWxjaGVteS4K
ID4+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwu
Y29tPgogPj4gVGVzdGVkLUJ5OiBGbMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0
ZXNjLmNvbS5icj4KID4+IFNpZ25lZC1vZmYtYnk6IEZsw6F2aW8gVGFwYWrDs3MgPGZsYXZpby50
YXBham9zQG5ld3Rlc2MuY29tLmJyPgoKID4gIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgeW91IGNo
ZXJyeS1waWNrZWQgdGhhdCBwYXRjaCBmcm9tIHRoZQogPiAgcGVwNTE3LXNldHVwdG9vbHMgc2Vy
aWVzIC0gQUZBSUNTIGl0IHNob3VsZG4ndCBiZSBuZWVkZWQgZm9yIHRoZQogPiAgdmVyc2lvbiBi
dW1wLiBCdXQgc2luY2UgaXQgbmVlZHMgdG8gYmUgYXBwbGllZCBhdCBzb21lIHBvaW50IGFueXdh
eSwKID4gSSBhcHBsaWVkIGJvdGggdG8gbWFzdGVyLCB0aGFua3MuCgpTbyBpdCBpcyBwcmVzdW1h
Ymx5IG5vdCBuZWVkZWQgZm9yIDIwMjQuMDIueCwgcmlnaHQ/CgotLSAKQnllLCBQZXRlciBLb3Jz
Z2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
