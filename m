Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510F5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 15:57:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7775861186
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 15:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7775861186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1030D402A3;
	Wed, 15 Sep 2021 15:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aXJVQMxWs7-9; Wed, 15 Sep 2021 15:57:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17895401F0;
	Wed, 15 Sep 2021 15:57:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC7951BF3A3
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 15:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CB2782C91
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 15:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tmpZ8ujrefHa for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 15:57:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D19382C8F
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 15:57:23 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id DEB2B1C0002
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 15:57:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mQXHj-0007aC-Tb
 for buildroot@buildroot.org; Wed, 15 Sep 2021 17:57:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 17:57:19 +0200
Message-ID: <877dfhu90g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.05.2 released
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cDovL2J1aWxkcm9vdC5vcmcpLgoKQnVpbGRyb290IDIw
MjEuMDUuMiBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjA1LjIudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjA1LjIudGFyLmJ6MgoKT3IgZ2V0
IGl0IGZyb20gR2l0OgoKZ2l0Oi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290CgpCdWlsZHJv
b3QgMjAyMS4wNS4yIGlzIGEgYnVnZml4IHJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBv
cnRhbnQgLwpzZWN1cml0eSByZWxhdGVkIGlzc3VlcyBkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDIx
LjA1LjEgcmVsZWFzZS4KCi0gVG9vbGNoYWluOiBEaXNhYmxlIGZvcnRpZnkgc3VwcG9ydCBmb3Ig
TWljcm9ibGF6ZSBhcyBpdCBpcyBub3QKICBjdXJyZW50bHkgd29ya2luZy4KCi0gU2VjdXJpdHkg
Zml4ZXMgZm9yIGMtYXJlcywgY3BpbywgZmV0Y2htYWlsLCBnZCwgZ28sIGhhcHJveHksIGpzemlw
LAogIGxpYmFyY2hpdmUsIGxpYmV4aWYsIGxpYm9wZW5zc2wsIGxpYnNzaCwgbGlieGNyeXB0LCBt
YywgbW9zcXVpdHRvLAogIG5vZGVqcywgcG9zdGdyZXNxbCwgcHJvc29keSwgcHl0aG9uLXBpbGxv
dywgcHl0aG9uMywgc3lscGhlZWQsIHRvciwKICB2aW0KCi0gRml4ZXMgZm9yIGRvd25sb2FkL2Nv
bXBpbGF0aW9uL3J1bnRpbWUvbGljZW5zZSBpc3N1ZXMgaW4gYWxzYS11dGlscywKICBhcm0tdHJ1
c3RlZC1maXJtd2FyZSwgYmVsbGUtc2lwLCBidWxsZXQsIGJ1c3lib3gsIGNqc29uLCBjb3JldXRp
bHMsCiAgZWlnZW4sIGVudmlyb25tZW50LXNldHVwLCBmZm1wZWcsIGZvbnRjb25maWcsIGdkYiwg
Z251cmFkaW8sIGdudXRscywKICBpcG1pdXRpbCwgaXB1dGlscywga3ZtLXVuaXQtdGVzdHMsIGxp
YmdjcnlwdCwgbGlibW9kc2VjdXJpdHksIGxpYnJzdmcsCiAgbGlic2hvdXQsIGxpbnV4LXBhbSwg
bG9jYWxlZGVmLCBtZXNhM2QsIG5ldHNuaWZmLW5nLCBuZ2lueCwgb2dyZSwKICBvcGVuamRrLCBv
cGVubXBpLCBvcGVudm10b29scywgcGVybC1uZXQtc3NoMiwgcGlwZXdpcmUsIHByZWxpbmstY3Jv
c3MsCiAgcHJvdG9idWYsIHB5dGhvbi1weXVkZXYsIHF0NWJhc2UsIHNhbWJhNCwgc2RsMiwgc294
LCBzd3VwZGF0ZSwgdGFyLAogIHRlcm1pbm9sb2d5LCB1Ym9vdC10b29scywgdWhkLCB1bmJvdW5k
LCB1c2hhcmUsIHdscm9vdHMsIHhhcHBfeHJkYiwKICB4YXBwX3h3ZCwgeGVuLCB4ZW5vbWFpLCB4
bGliX2xpYlhmb250MiwgeGxpYl9saWJYZnQsIHppcAoKRm9yIG1vcmUgZGV0YWlscywgc2VlIHRo
ZSBDSEFOR0VTIGZpbGU6CgpodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9wbGFp
bi9DSEFOR0VTP2lkPTIwMjEuMDUuMgoKVXNlcnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFy
ZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhl
IHBlb3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zbiAy
MDIxLjA1LjEuLgoKICAgIDU1ICBGYWJyaWNlIEZvbnRhaW5lCiAgICAxMCAgUGV0ZXIgS29yc2dh
YXJkCiAgICAgOCAgQmVybmQgS3VobHMKICAgICA3ICBKYW1lcyBIaWxsaWFyZAogICAgIDUgIEdp
dWxpbyBCZW5ldHRpCiAgICAgNCAgRnJhbmNvaXMgUGVycmFkCiAgICAgNCAgUm9tYWluIE5hb3Vy
CiAgICAgMyAgQW5nZWxvIENvbXBhZ251Y2NpCiAgICAgMyAgVGhvbWFzIFBldGF6em9uaQogICAg
IDIgIEFzYWYgS2FobG9uCiAgICAgMiAgQmFydWNoIFNpYWNoCiAgICAgMiAgQ2hyaXN0aWFuIFN0
ZXdhcnQKICAgICAyICBKYW1lcyBLbmlnaHQKICAgICAyICBNYXR0aGV3IFdlYmVyCiAgICAgMiAg
TWljaGFlbCBGaXNjaGVyCiAgICAgMSAgQWRyaWFuIEFtYWdsaW8KICAgICAxICBBbGV4YW5kZXIg
RWdvcmVua292CiAgICAgMSAgQ29ucmFkIFJhdHNjaGFuCiAgICAgMSAgR2xlYiBNYXpvdmV0c2tp
eQogICAgIDEgIEtyenlzenRvZiBLYW5hcwogICAgIDEgIEt5bGUgSGFyZGluZwogICAgIDEgIE1p
Y2hhZWwgTm9zdGhvZmYKICAgICAxICBOZXZvIEhlZAogICAgIDEgIFF1ZW50aW4gU2NodWx6CiAg
ICAgMSAgU8OpYmFzdGllbiBTenltYW5za2kKICAgICAxICBUaXRvdWFuIENocmlzdG9waGUKICAg
ICAxICBZYW5uIEUuIE1PUklOCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
