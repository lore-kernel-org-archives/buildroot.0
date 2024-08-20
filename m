Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFE4C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 19:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B04A40457;
	Tue, 20 Aug 2024 19:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKKPSscjZI9B; Tue, 20 Aug 2024 19:29:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58F2A40B09
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58F2A40B09;
	Tue, 20 Aug 2024 19:29:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 227571BF378
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CB7A40B09
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4MYNAbqfyDzm for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 19:29:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 905D540457
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 905D540457
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 905D540457
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 19:29:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20F58E0005;
 Tue, 20 Aug 2024 19:29:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sgUXX-00HQz1-1V;
 Tue, 20 Aug 2024 21:29:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
References: <20240619073252.411472-1-yegorslists@googlemail.com>
 <CAGm1_ktR5h+VeV37voAzZ8jTugdMg=wWdzVWqSBN2w8Bi19uqQ@mail.gmail.com>
 <29fae247-b4d0-49d5-a1b6-78017c6133b2@smile.fr>
Date: Tue, 20 Aug 2024 21:29:11 +0200
In-Reply-To: <29fae247-b4d0-49d5-a1b6-78017c6133b2@smile.fr> (Romain Naour via
 buildroot's message of "Sun, 14 Jul 2024 23:12:46 +0200")
Message-ID: <875xrvf0xk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/attr: add missing libgen.h header
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBIZWxsbyBZZWdvciwgQWxsLAogPiBMZSAxMC8wNy8y
MDI0IMOgIDEyOjI3LCBZZWdvciBZZWZyZW1vdiB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6CiA+
PiBIaSBBbGwsCiA+PiAKID4+IE9uIFdlZCwgSnVuIDE5LCAyMDI0IGF0IDk6MzPigK9BTSA8eWVn
b3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgogPj4+IAogPj4+IEZyb206IFllZ29yIFll
ZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KID4+PiAKID4+PiBSZXNvbHZlcyB0
aGUgZm9sbG93aW5nIGVycm9yIHdoZW4gYnVpbGRpbmcgYWdhaW5zdCBNVVNMOgogPj4+IAogPj4+
IHRvb2xzL2F0dHIuYzogSW4gZnVuY3Rpb24gJ21haW4nOgogPj4+IHRvb2xzL2F0dHIuYzo2OToy
MDogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdiYXNlbmFtZScKID4+
PiBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KID4+PiA2OSB8ICAgICAgICAgcHJv
Z25hbWUgPSBiYXNlbmFtZShhcmd2WzBdKTsKID4+PiB8ICAgICAgICAgICAgICAgICAgICBefn5+
fn5+fgogPj4+IHRvb2xzL2F0dHIuYzo2OToxODogZXJyb3I6IGFzc2lnbm1lbnQgdG8gJ2NoYXIg
KicgZnJvbSAnaW50JyBtYWtlcwogPj4+IHBvaW50ZXIgZnJvbSBpbnRlZ2VyIHdpdGhvdXQgYSBj
YXN0IFstV2ludC1jb252ZXJzaW9uXQogPj4+IDY5IHwgICAgICAgICBwcm9nbmFtZSA9IGJhc2Vu
YW1lKGFyZ3ZbMF0pOwogPj4+IHwgICAgICAgICAgICAgICAgICBeCiA+Pj4gCiA+Pj4gVXBzdHJl
YW06IGh0dHBzOi8vbGlzdHMubm9uZ251Lm9yZy9hcmNoaXZlL2h0bWwvYWNsLWRldmVsLzIwMjQt
MDMvbXNnMDAwMDAuaHRtbAogPj4gCiA+PiBUaGUgcGF0Y2ggd2FzIG1lcmdlZCBbMV0gdXBzdHJl
YW0gYnV0IHRoZXJlIGlzIHN0aWxsIG5vIG5ldyByZWxlYXNlLgogPj4gCiA+PiBbMV0gaHR0cHM6
Ly9naXQuc2F2YW5uYWgubm9uZ251Lm9yZy9jZ2l0L2F0dHIuZ2l0L2NvbW1pdC8/aWQ9OGE4MGQ4
OTVkZmQ3NzkzNzMzNjNjM2E0YjYyZWNjZTVhNTQ5ZWZiMgoKID4gSSByZXBsYWNlZCB0aGUgcGF0
Y2ggYnkgdGhlIHVwc3RyZWFtIG9uZSB3aXRoIHRoZSBjb3JyZWN0IGF1dGhvcnNoaXAuCgogPiBB
cHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQ29tbWl0dGVkIHRvIDIwMjQuMDIueCBhbmQgMjAy
NC4wNS54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
