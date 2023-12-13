Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C05C4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 21:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF64A43624;
	Wed, 13 Dec 2023 21:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF64A43624
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9D9IIoJopIv; Wed, 13 Dec 2023 21:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE88943620;
	Wed, 13 Dec 2023 21:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE88943620
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3097B1BF40E
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 21:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 093E58228D
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 21:16:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 093E58228D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h51I9ssMfYQz for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 21:16:15 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA795813C7
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 21:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA795813C7
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFD2A240004;
 Wed, 13 Dec 2023 21:16:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rDWaR-00BNXe-0Q;
 Wed, 13 Dec 2023 22:16:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20231211095614.182498-1-tanyuan@tinylab.org>
 <f63d5836-a4fe-467e-b928-184a4aafae26@mind.be>
Date: Wed, 13 Dec 2023 22:16:11 +0100
In-Reply-To: <f63d5836-a4fe-467e-b928-184a4aafae26@mind.be> (Arnout
 Vandecappelle's message of "Wed, 13 Dec 2023 22:03:39 +0100")
Message-ID: <87cyv94xd0.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] Inquiry About Mirroring Methods for Buildroot
 Packages
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
Cc: yann.morin.1998@free.fr, Yuan Tan <tanyuan@tinylab.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFybm91dCIgPT0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3
cml0ZXM6CgogPiBPbiAxMS8xMi8yMDIzIDEwOjU2LCBZdWFuIFRhbiB3cm90ZToKID4+IEhpLAog
Pj4gSSBhbSByZWFjaGluZyBvdXQgdG8gaW5xdWlyZSBhYm91dCB0aGUgYmVzdCBwcmFjdGljZXMg
Zm9yIG1pcnJvcmluZwogPj4gQnVpbGRyb290IHBhY2thZ2VzLiBXZSBhaW0gdG8gZXN0YWJsaXNo
IGEgcmVsaWFibGUgbWlycm9yIGZvciB0aGVzZQogPj4gcGFja2FnZXMsIHBhcnRpY3VsYXJseSB0
byBmYWNpbGl0YXRlIGFjY2VzcyBmb3IgdXNlcnMgaW4gcmVnaW9ucyBsaWtlCiA+PiBtYWlubGFu
ZCBDaGluYSwgd2hlcmUgZG93bmxvYWRpbmcgcGFja2FnZXMgY2FuIHNvbWV0aW1lcyBiZSBjaGFs
bGVuZ2luZy4KCiA+ICBXZSB1c2UgY2xvdWRmbGFyZSBDRE4uIEkganVzdCByZWFkIHVwIG9uIGl0
IGFuZCBpdCBzZWVtcyB0aGVyZSdzIGEKID4gIHNlcGFyYXRlIENETiB0aGF0IG5lZWRzIHRvIGJl
IGVuYWJsZWQgdG8gc2VydmUgQ2hpbmEuIFBlcmhhcHMgdGhhdAogPiBqdXN0IG5lZWRzIHRvIGJl
IGVuYWJsZWQ/CiA+IFBldGVyPwoKSG1tLCBJIGd1ZXNzIHlvdSBhcmUgcmVmZXJyaW5nIHRvCmh0
dHBzOi8vd3d3LmNsb3VkZmxhcmUuY29tL2FwcGxpY2F0aW9uLXNlcnZpY2VzL3Byb2R1Y3RzL2No
aW5hLW5ldHdvcmsvPwoKSWYgc28sIHRoYXQgZG9lc24ndCBsb29rIGFzIGlmIHRoYXQgaXMganVz
dCBzb21ldGhpbmcgeW91IGNhbiBlbmFibGUgZm9yCnRoZWlyIGZyZWUgb2ZmZXJpbmcsIEUuRy4g
eW91IGFwcGFyZW50bHkgbmVlZCBhICJJQ1AgbGljZW5zZSI6CgpXaGF0IGlzIGFuIElDUCBsaWNl
bnNlCgpJQ1AgaXMgdGhlIHNob3J0IG5hbWUgZm9yICJJbnRlcm5ldCBDb250ZW50IFByb3ZpZGVy
Ii4gQWNjb3JkaW5nIHRvCkNoaW5lc2UgcmVndWxhdGlvbnMsIGFsbCB3ZWJzaXRlcyBob3N0ZWQg
aW4gTWFpbmxhbmQgQ2hpbmEgb3IgY29udGVudApzZXJ2ZWQgZnJvbSBDaGluZXNlIGRhdGEgY2Vu
dGVycyAod2hpY2ggaXMgdHJ1ZSBmb3Igb3VyIENoaW5hIE5ldHdvcmsKc2VydmljZSkgbmVlZHMg
dG8gb2J0YWluIGFuIElDUCAiQmVpQW7lpIfmoYgiIG9yICJMaWNlbnNlIOivgSIgbnVtYmVyIGZv
cgpldmVyeSBkb21haW4gdGhhdCBzZXJ2ZXMgY29udGVudCB0byB5b3VyIHBhZ2VzLiBUaGlzIG51
bWJlciBuZWVkcyB0byBiZQpkaXNwbGF5ZWQgb24gdGhlIGZvb3RlciBvZiB5b3VyIHBhZ2VzLgoK
ID4+IEkgaGF2ZSB0d28gc3VnZ2VzdGlvbnMgYW5kIHdvdWxkIGxpa2UgdG8ga25vdyBpZiBlaXRo
ZXIgaXMgcG9zc2libGU6CiA+PiAxLiBDb3VsZCB5b3UgZW5hYmxlIHJzeW5jIGZvciBzb3VyY2Vz
LmJ1aWxkcm9vdC5uZXQ/IFRoaXMgd291bGQgbWFrZQogPj4gaXQKID4+IGVhc2llciBmb3IgbWly
cm9yIHNpdGVzIHRvIHN0YXkgdXBkYXRlZC4KID4+IDIuIElmIHJzeW5jIGlzbid0IGFuIG9wdGlv
biwgd291bGQgaXQgYmUgb2theSB0byB1c2Ugd2dldCB0byBjbG9uZQogPj4gdGhlCiA+PiBlbnRp
cmUgc291cmNlcy5idWlsZHJvb3QubmV0PwoKID4gIFdvdWxkbid0IGl0IGJlIGVhc2llciB0byBj
b25zdHJ1Y3QgeW91ciBvd24gdmVyc2lvbiwgYnkgcnVubmluZyB0aGUKID4gIHNhbWUgc2NyaXB0
IHRoYXQgUGV0ZXIgdXNlcyB0byB1cGRhdGUgYWN0dWFsIHNvdXJjZXMuYnVpbGRyb290Lm5ldD8K
ID4gIFRob3VnaCBJSVVDIHRoYXQgc2NyaXB0IGlzIGEgYml0IG9mIGEgaGFjay4KCnllcywgaXQg
aXMgYSBiaWcgaGFjay4gSXQgYmFzaWNhbGx5IHJ1bnMgbWFrZSBhbGx5ZXNwYWNrYWdlY29uZmln
ICYmCm1ha2Ugc291cmNlLCBidXQgdGhlbiBkb2VzIGEgbnVtYmVyIG9mIG11dGF0aW9ucyBhcyB3
ZWxsIHRvIHRyeSB0byBjYXRjaApwZXItYXJjaGl0ZWN0dXJlIHBhY2thZ2VzIG9yIHBhY2thZ2Vz
IHdpdGggbXVsdGlwbGUgdmVyc2lvbnMuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
