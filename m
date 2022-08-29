Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0FEECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 11:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2976960F4B;
	Mon, 29 Aug 2022 11:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2976960F4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Ab5ptRpCbwU; Mon, 29 Aug 2022 11:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57CB560864;
	Mon, 29 Aug 2022 11:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57CB560864
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE1571BF2BD
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99C7081991
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 11:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99C7081991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mc1EHlb9_xpp for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 11:15:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16E8781926
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16E8781926
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 11:15:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 305BBE0004;
 Mon, 29 Aug 2022 11:15:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oSck1-00HFwM-7y; Mon, 29 Aug 2022 13:15:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220426132833.1579873-1-salvador.joseluis@gmail.com>
 <20220727000402.53dff223@windsurf>
Date: Mon, 29 Aug 2022 13:15:41 +0200
In-Reply-To: <20220727000402.53dff223@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 27 Jul 2022 00:04:02 +0200")
Message-ID: <87tu5v47xe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual/prerequisite.txt: add
 diffutils
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
Cc: =?utf-8?Q?Jos=C3=A9?= Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gT24gVHVlLCAyNiBBcHIgMjAyMiAxNToyODoz
NCArMDIwMAogPiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdt
YWlsLmNvbT4gd3JvdGU6CgogPj4gUGF0Y2ggdGl0bGU6IGRvY3MvbWFudWFsL3ByZXJlcXVpc2l0
ZS50eHQ6IGFkZCBkaWZmdXRpbHMKID4+IAogPj4gVGhlIGNvbW1hbmQgYGNtcGAgaXMgdXNlZCBi
eSBgcGFja2FnZS9wa2ctZ2VuZXJpYy5ta2AgYXQgY29tbWl0CiA+PiA4NjIzY2M1ZGViNS4gVGhp
cyBjb21tYW5kIGlzIHByb3ZpZGVkIGJ5IGBkaWZmdXRpbHNgLgogPj4gCiA+PiBTaWduZWQtb2Zm
LWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNv
bT4KID4+IC0tLQogPj4gZG9jcy9tYW51YWwvcHJlcmVxdWlzaXRlLnR4dCB8IDEgKwogPj4gMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgogPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtz
LgoKID4gSW4gYWRkaXRpb24gdG8gdGhpcyBwYXRjaCB3ZSBhbHNvOgoKID4gIDEuIEFkZGVkIGEg
Y2hlY2sgZm9yIGNtcCBpbiBzdXBwb3J0L2RlcGVuZGVuY2llcy9kZXBlbmRlbmNpZXMuc2gKCiA+
ICAyLiBEcm9wcGVkIHRoZSB1c2Ugb2YgaG9zdC1kaWZmdXRpbHMgZnJvbSBvcGtnLXV0aWxzCgog
PiAgMy4gRHJvcHBlZCBob3N0LWRpZmZ1dGlscyBpdHNlbGYKCkNvbW1pdHRlZCBhbGwgNCB0byAy
MDIyLjA1LnggYW5kIDIwMjIuMDIueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJk
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
